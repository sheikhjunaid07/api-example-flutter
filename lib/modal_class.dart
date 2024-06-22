// To parse this JSON data, do
//
//     final sampleCode = sampleCodeFromJson(jsonString);

import 'dart:convert';

List<SampleCode> sampleCodeFromJson(String str) =>
    List<SampleCode>.from(json.decode(str).map((x) => SampleCode.fromJson(x)));

String sampleCodeToJson(List<SampleCode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleCode {
  int userId;
  int id;
  String title;
  String body;

  SampleCode({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory SampleCode.fromJson(Map<String, dynamic> json) => SampleCode(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
