import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/src/controllers/core_controller.dart';
import 'package:sample/src/routes/bindings.dart';
import 'package:sample/src/routes/pages.dart';
import '../../routes/routes.dart';

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CoreController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GoRoutes.home,
      initialBinding: BindingsBuilder(() => bindings),
      getPages: GoPages.list,
    );
  }
}
