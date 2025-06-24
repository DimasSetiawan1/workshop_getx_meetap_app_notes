import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:workshop_getx_meetap_app_notes/domain/entity/item_note_entity.dart';
import 'package:workshop_getx_meetap_app_notes/sharing/utils/get_storage_utils.dart';

class CounterController extends GetxController {
  RxList<ItemNoteEntity> notes = <ItemNoteEntity>[].obs;
  void readNotes() {
    notes.clear();
    var datas = GetStorageUtils.read<String>('notes');
    var datasRes = jsonDecode(datas) as List<dynamic>;
    if (datasRes.isNotEmpty) {
      for (var item in datasRes) {
        notes.add(ItemNoteEntity.fromJson(item as Map<String, dynamic>));
      }
    } else {  
      log('No notes found');
    }
  }

  void deleteNote(int id) {
    var datas = GetStorageUtils.read<String>('notes');
    var datasRes = jsonDecode(datas) as List<dynamic>;
    if (datasRes.isEmpty) {
      log('No notes to delete');
      return;
    }
    notes.clear();
    notes.value =
        datasRes
            .map((e) => ItemNoteEntity.fromJson(e as Map<String, dynamic>))
            .toList();
    notes.removeWhere((note) => note.id == id);
    var updatedNotes = notes.map((note) => note.toJson()).toList();
    GetStorageUtils.save<String>('notes', jsonEncode(updatedNotes));
    log('Note with id $id deleted');
  }

  @override
  void onInit() {
    readNotes();
    super.onInit();
  }
}
