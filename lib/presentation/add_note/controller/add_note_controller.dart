import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:workshop_getx_meetap_app_notes/domain/entity/item_note_entity.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/utils/get_storage_utils.dart';

class AddNoteController extends GetxController {
  var getId = 0.obs;

  List<Map<String, dynamic>> currentData = <Map<String, dynamic>>[];

  void saveNote(String key, String note) {
    var notes = GetStorageUtils.read<String>(key);
    var notesRes = jsonDecode(notes) as List<dynamic>;
    if (notesRes.isNotEmpty) {
      currentData.clear();
      currentData = notesRes.map((e) => e as Map<String, dynamic>).toList();
      currentData.add(jsonDecode(note) as Map<String, dynamic>);
    } else {
      final itemNote = (jsonDecode(note));
      currentData.add(itemNote);
    }
    GetStorageUtils.save<String>(key, jsonEncode(currentData));
  }

  void updateNote(String key, ItemNoteEntity note) {
    var notes = GetStorageUtils.read<String>(key);
    var notesRes = jsonDecode(notes) as List<dynamic>;
    if (notesRes.isNotEmpty) {
      currentData.clear();
      currentData = notesRes.map((e) => e as Map<String, dynamic>).toList();
      for (var i = 0; i < currentData.length; i++) {
        if (currentData[i]['id'] == note.id) {
          currentData[i] = note.toJson();
          log('Note updated: ${note.title}');
          break;
        }
      }
      GetStorageUtils.save<String>(key, jsonEncode(currentData));
    } else {
      log('No notes found to update');
    }
  }

  

  int check() {
    var notes = GetStorageUtils.read<String>('notes');
    var notesRes = jsonDecode(notes) as List<dynamic>;
    if (notesRes.isNotEmpty) {
      var notesList = notesRes.length + 1;
      getId.value = notesList;
      return getId.value;
    } else {
      getId.value = 1;
      return getId.value;
    }
  }

  @override
  void onInit() {
    check();
    super.onInit();
  }
}
