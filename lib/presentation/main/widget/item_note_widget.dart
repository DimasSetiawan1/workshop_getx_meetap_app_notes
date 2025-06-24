import 'package:flutter/material.dart';
import 'package:workshop_getx_meetap_app_notes/domain/entity/item_note_entity.dart';

class ItemNote extends StatelessWidget {
  final ItemNoteEntity item;
  final Function()? onTapDelete;

  const ItemNote({super.key, required this.item, required this.onTapDelete});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 7),
    decoration: BoxDecoration(
      color: Color(0xFF444444),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "${item.title} - ${item.dateTime}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        InkWell(
          onTap: onTapDelete,
          child: Image.asset(
            'assets/icon/ic_remove.png',
            width: 20,
            height: 20,
          ),
        ),
      ],
    ),
  );
}
