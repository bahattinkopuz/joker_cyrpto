import 'dart:convert';

List<CyrptoDetail> cyrptoDetailFromJson(String str) => List<CyrptoDetail>.from(
    json.decode(str).map((x) => CyrptoDetail.fromJson(x)));

String cyrptoDetailToJson(List<CyrptoDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CyrptoDetail {
  CyrptoDetail({
    required this.id,
    required this.coinId,
    required this.text,
    required this.title,
    required this.direction,
    required this.imgPath,
    required this.imgPathWithText,
    required this.state,
    required this.updateTime,
  });

  int id;
  int coinId;
  String text;
  String title;
  int direction;
  String imgPath;
  String imgPathWithText;
  bool state;
  DateTime updateTime;

  factory CyrptoDetail.fromJson(Map<String, dynamic> json) => CyrptoDetail(
        id: json["id"],
        coinId: json["coinId"],
        title: json["title"],
        text: json["text"],
        direction: json["direction"],
        imgPath: json["imgPath"],
        imgPathWithText: json["imgPathWithText"],
        state: json["state"],
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coinId": coinId,
        "title": title,
        "text": text,
        "direction": direction,
        "imgPath": imgPath,
        "imgPathWithText": imgPathWithText,
        "state": state,
        "updateTime": updateTime.toIso8601String(),
      };
}
