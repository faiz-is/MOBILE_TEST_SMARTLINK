import 'package:get/get.dart';
import 'package:sample/src/controllers/core_controller.dart';

//only single controller
final bindings = {
  Get.lazyPut<CoreController>(() => CoreController(), fenix: true),
};
