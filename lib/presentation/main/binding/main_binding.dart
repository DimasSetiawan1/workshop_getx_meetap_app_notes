import 'package:get/get.dart';
import 'package:workshop_getx_meetap_app_notes/presentation/main/controller/counter_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}
