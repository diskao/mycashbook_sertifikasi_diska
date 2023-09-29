import 'package:get/get.dart';

import 'tambah_pengeluaran_controller.dart';

class TambahPengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPengeluaranController>(
      () => TambahPengeluaranController(),
    );
  }
}
