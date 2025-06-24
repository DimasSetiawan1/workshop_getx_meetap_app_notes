import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_getx_meetap_app_notes/domain/entity/item_note_entity.dart';
import 'package:workshop_getx_meetap_app_notes/presentation/add_note/controller/add_note_controller.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/component/widget/custom_button_widget.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/utils/get_storage_utils.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  ItemNoteEntity? _itemNoteEntity;

  @override
  void initState() {
    if (Get.arguments != null) {
      _itemNoteEntity = Get.arguments as ItemNoteEntity;
      _titleController.text = _itemNoteEntity!.title;
      _noteController.text = _itemNoteEntity!.content;
    } else {}

    super.initState();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final addController = Get.put(AddNoteController());

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "My Title",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _noteController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a note';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "My Note ...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            CustomButtonWidget(
              "Save Note",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_itemNoteEntity != null) {
                    addController.updateNote(
                      'notes',
                      ItemNoteEntity(
                        id: _itemNoteEntity!.id,
                        title: _titleController.text,
                        content: _noteController.text,
                        dateTime: DateTime.now().toString(),
                      ),
                    );
                    Get.snackbar(
                      "Success",
                      "Note updated successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    addController.check();
                    var getId = addController.getId.value;
                    addController.saveNote(
                      'notes',
                      itemNoteEntityToJson(
                        ItemNoteEntity(
                          id: getId,
                          title: _titleController.text,
                          content: _noteController.text,
                          dateTime: DateTime.now().toString(),
                        ),
                      ),
                    );
                    Get.snackbar(
                      "Success",
                      "Note saved successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }
                } else {
                  Get.snackbar(
                    "Error",
                    "Please fill in all fields",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ],
        ),
      ),
    );
  }
}
