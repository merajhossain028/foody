import 'dart:convert';

List<CatagoriesModel> catagoriesModelFromJson(String str) =>
    List<CatagoriesModel>.from(
        json.decode(str).map((x) => CatagoriesModel.fromJson(x)));

String catagoriesModelToJson(List<CatagoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatagoriesModel {
  final String id;
  final String title;
  final String value;
  final String imageUrl;

  CatagoriesModel({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  factory CatagoriesModel.fromJson(Map<String, dynamic> json) =>
      CatagoriesModel(
        id: json["_id"],
        title: json["title"],
        value: json["value"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "value": value,
        "imageUrl": imageUrl,
      };
}
