// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

List<ProductDetailsModel> productDetailsModelFromJson(String str) => List<ProductDetailsModel>.from(json.decode(str).map((x) => ProductDetailsModel.fromJson(x)));

String productDetailsModelToJson(List<ProductDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetailsModel {
  String id;
  int productDetailsModelId;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  ProductDetailsModel({
    required this.id,
    required this.productDetailsModelId,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json["_id"],
    productDetailsModelId: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": productDetailsModelId,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  double rate;
  dynamic count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
