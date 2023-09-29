// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/app_color.dart';
import 'package:mycashbook_sertifikasi_diska/app/widgets/custom_input.dart';
import 'tambah_pemasukan_controller.dart';

// ignore: must_be_immutable
class TambahPemasukanScreen extends GetView<TambahPemasukanController> {
  late double mWidth;
  late double mHeight;
  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height / 1.2;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 233, 117, 109),
          title: const Text('Tambah Pemasukan'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: mHeight,
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                      controller: controller.dateC,
                      label: "Tanggal",
                      hint: "Pilih Tanggal",
                      suffixIcon: const Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      isDate: true,
                    ),
                    CustomInput(
                      controller: controller.nominalC,
                      label: "Nominal",
                      hint: "Masukkan Nominal",
                      suffixIcon: const Icon(
                        Icons.money,
                        color: Colors.black,
                      ),
                      isNumber: true,
                      isNominal: true,
                    ),
                    CustomInput(
                      controller: controller.descriptionC,
                      label: "Keterangan",
                      hint: "Masukkan keterangan",
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.resetForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      primary: const Color.fromARGB(255, 209, 72, 62),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.tambahPemasukan();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        primary: Color.fromARGB(183, 190, 48, 143),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        (controller.isLoading.isFalse)
                            ? 'Simpan'
                            : 'Loading...',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      primary: Color.fromARGB(255, 170, 55, 93),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
