import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:mycashbook_sertifikasi_diska/app/models/cashflow.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/database_helper.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/extract_month.dart';

class BerandaController extends GetxController {
  final dbHelper = DatabaseHelper.instance;
  RxList<CashFlow> cashflows = RxList<CashFlow>();

  // Deklarasi dan inisialisasi list data totalIncome dan totalExpense
  RxList<FlSpot> incomeSpots = RxList<FlSpot>();
  RxList<FlSpot> expenseSpots = RxList<FlSpot>();

  @override
  void onInit() {
    super.onInit();
    loadCashflows();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void reInitialize() {
    onInit();
  }

  // Fungsi untuk mengisi data totalIncome dan totalExpense dari cashflow
  void fillSpotsFromCashflows(List<CashFlow> cashflows) {
    // Bersihkan list sebelum mengisi ulang
    incomeSpots.clear();
    expenseSpots.clear();

    // Buat map untuk mengelompokkan nilai berdasarkan tanggal
    final incomeMap = <double, double>{};
    final expenseMap = <double, double>{};

    // Iterasi melalui cashflows
    for (final cashflow in cashflows) {
      final date = cashflow.date;
      final nominal = cashflow.nominal.toDouble();

      // Tentukan apakah ini income atau expense berdasarkan status
      if (cashflow.status == 'income') {
        if (incomeMap.containsKey(extractMonth(date))) {
          // Jika date sudah ada, tambahkan nominal ke nilai yang sudah ada
          incomeMap[extractMonth(date)] =
              (incomeMap[extractMonth(date)] ?? 0) + nominal;
        } else {
          // Jika date belum ada, tambahkan sebagai kunci baru
          incomeMap[extractMonth(date)] = nominal;
        }
      } else if (cashflow.status == 'expense') {
        if (expenseMap.containsKey(extractMonth(date))) {
          // Jika date sudah ada, tambahkan nominal ke nilai yang sudah ada
          expenseMap[extractMonth(date)] =
              (expenseMap[extractMonth(date)] ?? 0) + nominal;
        } else {
          // Jika date belum ada, tambahkan sebagai kunci baru
          expenseMap[extractMonth(date)] = nominal;
        }
      }
    }

    // Konversi map menjadi daftar FlSpot
    incomeSpots.addAll(
        incomeMap.entries.map((entry) => FlSpot(entry.key, entry.value)));
    expenseSpots.addAll(
        expenseMap.entries.map((entry) => FlSpot(entry.key, entry.value)));

    print(incomeSpots);
    print(expenseSpots);
  }

  void loadCashflows() async {
    final cashflowList = await dbHelper.getCashflows();
    cashflows.assignAll(cashflowList);

    fillSpotsFromCashflows(cashflowList);
    update();
  }
}
