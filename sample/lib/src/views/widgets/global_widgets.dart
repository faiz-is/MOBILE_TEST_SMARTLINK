import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/controllers/core_controller.dart';

class GlobalWidgets {
  final controller = Get.find<CoreController>();

// Global widget Button Style
  ButtonStyle buttonStyle({Color? color}) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? Stain.buttonDisable),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
  }
//Global Widget Dilog
  dialogWidget() {
    return Get.defaultDialog(
        title: "Peringatan",
        middleText: "Anda belum menyelesaikan Transaksi \n Data yang sudah di isi akan hilang",
        backgroundColor: Stain.backround,
        titleStyle: const TextStyle(color: Colors.black),
        middleTextStyle: const TextStyle(color: Colors.black, fontSize: 12),
        barrierDismissible: false,
        confirm: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    controller.exit.value = true;
                    Get.close(2);
                    Get.deleteAll().then((value) => Get.lazyPut(() => CoreController()));
                  },
                  style: buttonStyle(color: Colors.blue),
                  child: const Text("Ok"))),
        ),
        cancel: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 100, child: ElevatedButton(onPressed: () => Get.back(), style: buttonStyle(color: Colors.red), child: const Text("Batal"))),
        ),
        radius: 20);
  }
}
