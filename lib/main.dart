

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/component.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/controller/global_controller.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/utils/get_storage_utils.dart';

void main() async {
  await GetStorage.init();
  GetStorageUtils();
  Get.put(GlobalController());
  runApp(const MyApp());
}
