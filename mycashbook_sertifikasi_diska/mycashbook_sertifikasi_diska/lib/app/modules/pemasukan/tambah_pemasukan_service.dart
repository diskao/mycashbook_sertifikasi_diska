import 'package:get/get.dart';

import 'tambah_pemasukan_controller.dart';

class TambahPemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPemasukanController>(
      () => TambahPemasukanController(),
    );
  }
}
