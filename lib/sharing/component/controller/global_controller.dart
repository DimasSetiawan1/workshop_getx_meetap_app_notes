import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  void call() {
    // print("im call you: GlobalController");
    // Get.snackbar("hello", "im call you: GlobalController");

    // TODO: DIALOG WITH DEFAULT
    Get.defaultDialog(
      title: "set title",
      cancel: Text("cancel"),
      confirm: Text("confirm"),
    );

    // TODO: DIALOG WITH WIDGET
    // Get.dialog(DetailScreen());

    // TODO: DIALOG WITH PAGEBUILDER IN GENERALDIALOG
    // Get.generalDialog(
    //   pageBuilder: (context, animation, secondaryAnimation) {
    //     return Container(
    //       decoration: BoxDecoration(color: Colors.white),
    //       child: Text("hello"),
    //     );
    //   },
    // );
  }
}
