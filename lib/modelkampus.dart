// To parse this JSON data, do
//
//     final modelKamus = modelKamusFromJson(jsonString);

import 'dart:convert';

List<ModelKamus> modelKamusFromJson(String str) => List<ModelKamus>.from(json.decode(str).map((x) => ModelKamus.fromJson(x)));

String modelKamusToJson(List<ModelKamus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelKamus {
  ModelKamus({
    this.id,
    this.istilah,
    this.kepanjangan,
    this.detailnya,
  });

  String id;
  String istilah;
  String kepanjangan;
  String detailnya;

  factory ModelKamus.fromJson(Map<String, dynamic> json) =>
      ModelKamus(
        id: json["id"],
        istilah: json["istilah"],
        kepanjangan: json["kepanjangan"],
        detailnya: json["detailnya"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "istilah": istilah,
        "kepanjangan": kepanjangan,
        "detailnya": detailnya,
      };

}