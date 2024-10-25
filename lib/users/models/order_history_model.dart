// To parse this JSON data, do
//
//     final orderHistoryItems = orderHistoryItemsFromJson(jsonString);

import 'dart:convert';

List<OrderHistoryItems> orderHistoryItemsFromJson(String str) => List<OrderHistoryItems>.from(json.decode(str).map((x) => OrderHistoryItems.fromJson(x)));

String orderHistoryItemsToJson(List<OrderHistoryItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistoryItems {
  String id;
  String orderId;
  List<Order> order;
  int v;

  OrderHistoryItems({
    required this.id,
    required this.orderId,
    required this.order,
    required this.v,
  });

  factory OrderHistoryItems.fromJson(Map<String, dynamic> json) => OrderHistoryItems(
    id: json["_id"],
    orderId: json["orderId"],
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "orderId": orderId,
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
    "__v": v,
  };
}

class Order {
  String id;
  int orderId;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Order({
    required this.id,
    required this.orderId,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"],
    orderId: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": orderId,
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
