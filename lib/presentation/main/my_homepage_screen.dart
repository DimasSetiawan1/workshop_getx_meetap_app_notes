import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workshop_getx_meetap_app_notes/domain/entity/item_note_entity.dart';
import 'package:workshop_getx_meetap_app_notes/presentation/main/controller/counter_controller.dart';
import 'package:workshop_getx_meetap_app_notes/presentation/main/widget/item_note_widget.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/controller/global_controller.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/widget/custom_appbar.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/widget/custom_button_widget.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/utils/get_storage_utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterController _controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes"),
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset("assets/icon/ic_three_line.png"),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TODO: CUSTOMAPPBAR
            // CustomAppbar(
            //   "Notes",
            //   startWidget: InkWell(
            //     onTap: (){
            //
            //     },
            //     child: Image.asset("assets/icon/ic_three_line.png",
            //       width: 30, height: 30,
            //     ),
            //   ),
            //   endWidget: InkWell(
            //     onTap: (){
            //
            //     },
            //     child: Container(
            //       height: 30,
            //       width: 30,
            //       decoration: BoxDecoration(
            //           color: Colors.grey,
            //           borderRadius: BorderRadius.circular(20)
            //       ),
            //     ),
            //   ),
            //   // assetPath: "assets/icon/ic_three_line.png",
            // ),

            // TODO: WITH BUILDER
            // Expanded(child: ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: 100,
            //   itemBuilder: (context, index) {
            //     return Container(child: Text("hello", style: TextStyle(color: Colors.white),));
            //   },
            // )),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _controller.readNotes();
                },
                child: Obx(
                  () => ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: List.generate(_controller.notes.length, (index) {
                      final item = _controller.notes[index];
                      return InkWell(
                        onTap: () {
                          log("Item tapped: ${item.title}");
                          Get.toNamed('add_note_screen', arguments: item);
                        },
                        child: ItemNote(
                          item: ItemNoteEntity(
                            id: index + 1,
                            title: item.title,
                            content: item.content,
                            dateTime: DateFormat(
                              'dd/MM/yyyy HH:mm a',
                            ).format(DateTime.parse(item.dateTime)),
                          ),
                          onTapDelete: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text("Delete Note"),
                                content: Text(
                                  "Are you sure you want to delete this note?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _controller.deleteNote(item.id);
                                      Get.back();
                                      log("Note deleted: ${item.title}");
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            CustomButtonWidget(
              "Add Note",
              onPressed: () {
                Get.toNamed('add_note_screen');
              },
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ],
        ),
      ),
    );

    // return Obx(
    //   () => Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //       title: Text(widget.title),
    //     ),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           const Text('You have pushed the button this many times:'),
    //           Text(
    //             '${controller.counter}',
    //             style: Theme.of(context).textTheme.headlineMedium,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
