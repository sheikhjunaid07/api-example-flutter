// To parse this JSON data, do
//
//     final modelNew = modelNewFromJson(jsonString);

import 'dart:convert';

List<ModelNew> modelNewFromJson(String str) =>
    List<ModelNew>.from(json.decode(str).map((x) => ModelNew.fromJson(x)));

String modelNewToJson(List<ModelNew> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelNew {
  int id;
  String name;
  String city;

  ModelNew({
    required this.id,
    required this.name,
    required this.city,
  });

  factory ModelNew.fromJson(Map<String, dynamic> json) => ModelNew(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}
