import 'dart:convert';

List<Cyrpto> cyrptoFromJson(String str) =>
    List<Cyrpto>.from(json.decode(str).map((x) => Cyrpto.fromJson(x)));

String cyrptoToJson(List<Cyrpto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cyrpto {
  Cyrpto({
    required this.id,
    required this.name,
    required this.shortName,
    required this.imgPath,
    required this.state,
    required this.updateTime,
  });

  int id;
  String name;
  String shortName;
  String imgPath;
  bool state;
  DateTime updateTime;

  factory Cyrpto.fromJson(Map<String, dynamic> json) => Cyrpto(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        imgPath: json["imgPath"],
        state: json["state"],
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "imgPath": imgPath,
        "state": state,
        "updateTime": updateTime.toIso8601String(),
      };
}
