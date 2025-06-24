

import 'dart:convert';

ItemNoteEntity itemNoteEntityFromJson(String str) => ItemNoteEntity.fromJson(json.decode(str));

String itemNoteEntityToJson(ItemNoteEntity data) => json.encode(data.toJson());

class ItemNoteEntity {
    int id;
    String title;
    String content;
    String dateTime;

    ItemNoteEntity({
        required this.id,
        required this.title,
        required this.content,
        required this.dateTime,
    });

    factory ItemNoteEntity.fromJson(Map<String, dynamic> json) => ItemNoteEntity(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        dateTime: json["dateTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "dateTime": dateTime,
    };
}
