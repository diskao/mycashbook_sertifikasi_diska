// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycashbook_sertifikasi_diska/app/modules/beranda/widgets/line_chart_widget.dart';
import 'package:mycashbook_sertifikasi_diska/app/modules/beranda/widgets/menu_widget.dart';
import 'package:mycashbook_sertifikasi_diska/app/routes/app_pages.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/app_color.dart';
import 'package:mycashbook_sertifikasi_diska/app/utils/currency_format.dart';
import 'beranda_controller.dart';

class BerandaScreen extends GetView<BerandaController> {
  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Bagian Ringkasan Pemasukan dan Pengeluaran Bulan Ini
            _buildSummaryContainer(mWidth),
            const SizedBox(height: 40),

            // Bagian Grafik Garis untuk Data Cash Flow
            _buildChartContainer(),

            // Bagian Menu-Menu Aplikasi
            _buildMenuGrid(),
          ],
        ),
      ),
    );
  }

  // Bagian Ringkasan Pemasukan dan Pengeluaran Bulan Ini
  Widget _buildSummaryContainer(double mWidth) {
    return Obx(
      () {
        int totalIncome = 0;
        int totalExpense = 0;

        // Loop melalui data pemasukan dan pengeluaran dalam controller
        for (final cashflow in controller.cashflows) {
          if (cashflow.status == "income") {
            totalIncome += cashflow.nominal;
          } else if (cashflow.status == "expense") {
            totalExpense += cashflow.nominal;
          }
        }

        return Column(
          children: [
            SizedBox(height: 10), // Spacing above the text

            // Judul "Rangkuman Bulan Ini" with shadow
            Text(
              'Rangkuman Bulan Ini',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 168, 168, 168),
                    offset: Offset(0, 1), // Shadow position
                    blurRadius: 1, // SShadow blur radius
                  ),
                ],
              ),
            ),

            // Total Pengeluaran with shadow
            Text(
              'Pengeluaran ${FormattedNominal(totalExpense)}',
              style: TextStyle(
                color: Color.fromARGB(255, 207, 39, 165),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 168, 168, 168),
                    offset: Offset(0, 1), // Shadow position
                    blurRadius: 1, // S// Shadow blur radius
                  ),
                ],
              ),
            ),

            // Total Pemasukan with shadow
            Text(
              "Pemasukan ${FormattedNominal(totalIncome)}",
              style: TextStyle(
                color: Color.fromARGB(255, 145, 26, 156),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 168, 168, 168),
                    offset: Offset(0, 1), // Shadow position
                    blurRadius: 1, // Shadow blur radius
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // Bagian Grafik Garis untuk Data Cash Flow
  Widget _buildChartContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 43, 13, 90),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const LineChartWidget(
        isShowingMainData: true,
      ),
    );
  }

  // Bagian Menu-Menu Aplikasi
  Widget _buildMenuGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildMenuItem(
            title: 'Tambah Pemasukan',
            image: AssetImage('assets/images/pendapatan.jpeg'),
            onTap: () => Get.toNamed(Routes.TAMBAH_PEMASUKAN),
          ),
          _buildMenuItem(
            title: 'Tambah Pengeluaran',
            image: AssetImage('assets/images/pengeluaran.png'),
            onTap: () => Get.toNamed(Routes.TAMBAH_PENGELUARAN),
          ),
          _buildMenuItem(
            title: 'Detail Cash Flow',
            image: AssetImage('assets/images/cash_flow.png'),
            onTap: () => Get.toNamed(Routes.DETAIL_CASH_FLOW),
          ),
          _buildMenuItem(
            title: 'Pengaturan',
            image: AssetImage('assets/images/settingss.png'),
            onTap: () => Get.toNamed(Routes.SETTING),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat item menu
  Widget _buildMenuItem({
    required String title,
    required AssetImage image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: MenuButton(
        title: title,
        image: image,
      ),
    );
  }
}
