import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mycashbook_sertifikasi_diska/app/modules/beranda/beranda_controller.dart';
import 'package:mycashbook_sertifikasi_diska/app/routes/app_pages.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/app_color.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/database_helper.dart';

class TambahPengeluaranController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController dateC = TextEditingController();
  TextEditingController nominalC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> resetForm() async {
    dateC.text = "01-01-2021";
    nominalC.clear();
    descriptionC.clear();
  }

  Future<void> addExpense() async {
    final date = dateC.text;
    final nominalWithRp = nominalC.text;
    final numericText = nominalWithRp.replaceAll("Rp ", "").replaceAll(".", "");
    final nominal = int.tryParse(numericText);
    final description = descriptionC.text;
    final status = "expense"; // Status income

    final cashflow = {
      'user_id': box.read('user_id'),
      'date': date,
      'nominal': nominal,
      'description': description,
      'status': status, // Konversi ke integer
    };

    final id = await dbHelper.insertCashflow(cashflow);

    if (id != null) {
      final BerandaController homeController = Get.put(BerandaController());
      homeController.reInitialize();
      Get.offNamed(Routes.BERANDA);
      Get.snackbar(
        'Berhasil',
        'Data pengeluaran berhasil disimpan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );
    } else {
      // Handle jika gagal menyimpan data
      Get.snackbar(
        'Error',
        'Gagal menyimpan data pengeluaran',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondary,
        colorText: Colors.white,
      );
    }
  }
}
