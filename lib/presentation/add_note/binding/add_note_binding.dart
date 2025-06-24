import 'package:get/get.dart';
import 'package:workshop_getx_meetap_app_notes/presentation/add_note/add_note_screen.dart';

class AddNoteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(() => AddNoteScreen());
  }
}