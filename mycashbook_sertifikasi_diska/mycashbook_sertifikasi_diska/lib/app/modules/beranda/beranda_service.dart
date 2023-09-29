import 'package:get/get.dart';
import 'beranda_controller.dart';

class BerandaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerandaController>(
      () => BerandaController(),
    );
  }
}
