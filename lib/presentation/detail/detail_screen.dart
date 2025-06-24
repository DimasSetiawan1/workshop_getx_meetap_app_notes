import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/controller/global_controller.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/utils/hello_test.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late HelloTest helloTest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helloTest = Get.find<HelloTest>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: MyWidget(myVal: "1001")),
      floatingActionButton: FloatingActionButton(
        onPressed: Get.find<GlobalController>().call,
        // onPressed: state.incrementCounter, // TODO: INCREMENT COUNTER
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
