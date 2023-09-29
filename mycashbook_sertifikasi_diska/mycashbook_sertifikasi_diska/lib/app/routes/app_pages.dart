// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import '../modules/pengeluaran/tambah_pengeluaran_service.dart';
import '../modules/pengeluaran/tambah_pengeluaran_screen.dart';
import '../modules/pemasukan/tambah_pemasukan_service.dart';
import '../modules/pemasukan/tambah_pemasukan_screen.dart';
import '../modules/detail/detail_cashflow_service.dart';
import '../modules/detail/detail_cashflow_screen.dart';
import '../modules/beranda/beranda_service.dart';
import '../modules/beranda/beranda_screen.dart';
import '../modules/login/login_service.dart';
import '../modules/login/login_screen.dart';
import '../modules/setting/setting_service.dart';
import '../modules/setting/setting_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.BERANDA,
      page: () => BerandaScreen(),
      binding: BerandaBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PEMASUKAN,
      page: () => TambahPemasukanScreen(),
      binding: TambahPemasukanBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PENGELUARAN,
      page: () => TambahPengeluaranScreen(),
      binding: TambahPengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CASH_FLOW,
      page: () => DetailCashFlowScreen(),
      binding: DetailCashFlowBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
  ];
}
