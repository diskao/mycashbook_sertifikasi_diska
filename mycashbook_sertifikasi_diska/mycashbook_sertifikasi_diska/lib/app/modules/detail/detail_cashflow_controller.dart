import 'package:get/get.dart';
import 'package:mycashbook_sertifikasi_diska/app/models/cashflow.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/database_helper.dart';

class DetailCashFlowController extends GetxController {
  final dbHelper = DatabaseHelper.instance;
  RxList<CashFlow> cashflows = RxList<CashFlow>();

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

  void loadCashflows() async {
    final cashflowList = await dbHelper.getCashflows();
    cashflows.assignAll(cashflowList);
  }
}
