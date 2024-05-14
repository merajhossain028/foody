import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    final bool status;
    final List<Category> categories;

    CategoriesModel({
        required this.status,
        required this.categories,
    });

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        status: json["status"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    final String id;
    final String title;
    final String value;
    final String imageUrl;

    Category({
        required this.id,
        required this.title,
        required this.value,
        required this.imageUrl,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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