import 'dart:convert';

class NotesModal {
  NotesModal({
    this.title,
    this.description,
    this.tag,
  });

  String? title;
  String? description;
  String? tag;

  factory NotesModal.fromJson(Map<String, dynamic> json) => NotesModal(
        title: json["title"],
        description: json["description"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "tag": tag,  
      };
}
