// To parse this JSON data, do
//
//     final cartResponse = cartResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CartResponse> cartResponseFromJson(String str) => List<CartResponse>.from(json.decode(str).map((x) => CartResponse.fromJson(x)));

String cartResponseToJson(List<CartResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartResponse {
    final String id;
    final String userId;
    final ProductId productId;
    final int quantity;
    final double totalPrice;

    CartResponse({
        required this.id,
        required this.userId,
        required this.productId,
        required this.quantity,
        required this.totalPrice,
    });

    factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json["_id"],
        userId: json["userId"],
        productId: ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        totalPrice: json["totalPrice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "productId": productId.toJson(),
        "quantity": quantity,
        "totalPrice": totalPrice,
    };
}

class ProductId {
    final String id;
    final String title;
    final String imageUrl;
    final String vendor;
    final double rating;
    final String ratingCount;

    ProductId({
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.vendor,
        required this.rating,
        required this.ratingCount,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        vendor: json["vendor"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "imageUrl": imageUrl,
        "vendor": vendor,
        "rating": rating,
        "ratingCount": ratingCount,
    };
}
