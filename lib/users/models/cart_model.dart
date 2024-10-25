// To parse this JSON data, do
//
//     final cartItemsDetails = cartItemsDetailsFromJson(jsonString);

import 'dart:convert';

List<CartItemsDetails> cartItemsDetailsFromJson(String str) => List<CartItemsDetails>.from(json.decode(str).map((x) => CartItemsDetails.fromJson(x)));

String cartItemsDetailsToJson(List<CartItemsDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItemsDetails {
  String id;
  int cartItemsDetailId;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  CartItemsDetails({
    required this.id,
    required this.cartItemsDetailId,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory CartItemsDetails.fromJson(Map<String, dynamic> json) => CartItemsDetails(
    id: json["_id"],
    cartItemsDetailId: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": cartItemsDetailId,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };
}

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
