import 'dart:convert';

List<Suggestion> suggestionFromJson(String str) =>
    List<Suggestion>.from(json.decode(str).map((x) => Suggestion.fromJson(x)));

String suggestionToJson(List<Suggestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Suggestion {
  Suggestion(
      {required this.id,
      required this.title,
      required this.direction,
      required this.text,
      required this.imgPath,
      required this.imgPathWithText,
      required this.state,
      required this.updateTime});

  int id;
  String title;
  int direction;
  String text;
  String imgPath;
  String imgPathWithText;
  bool state;
  DateTime updateTime;

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
      id: json['id'],
      title: json['title'],
      direction: json['direction'],
      text: json['text'],
      imgPath: json['imgPath'],
      imgPathWithText: json['imgPathWithText'],
      state: json['state'],
      updateTime: DateTime.parse(json['updateTime']));

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "direction": direction,
        "text": text,
        "imgPath": imgPath,
        "imgPathWithText": imgPathWithText,
        "state": state,
        "updateTime": updateTime.toIso8601String()
      };
}
