// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

List<OffersModel> offersModelFromJson(String str) => List<OffersModel>.from(json.decode(str).map((x) => OffersModel.fromJson(x)));

String offersModelToJson(List<OffersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffersModel {
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final List<String> offerTags;
    final String category;
    final List<String> offerType;
    final String code;
    final bool isAvailable;
    final String vendor;
    final double rating;
    final String ratingCount;
    final String description;
    final int quantity;
    final int price;
    final List<String> offerDishes;
    final int v;

    OffersModel({
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.offerTags,
        required this.category,
        required this.offerType,
        required this.code,
        required this.isAvailable,
        required this.vendor,
        required this.rating,
        required this.ratingCount,
        required this.description,
        required this.quantity,
        required this.offerDishes,
        required this.price,
        required this.v,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        offerTags: List<String>.from(json["offerTags"].map((x) => x)),
        category: json["category"],
        offerType: List<String>.from(json["offerType"].map((x) => x)),
        code: json["code"],
        isAvailable: json["isAvailable"],
        vendor: json["vendor"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        description: json["description"],
        quantity: json["quantity"],
        offerDishes: List<String>.from(json["offerDishes"].map((x) => x)),
        price: json["price"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "offerTags": List<dynamic>.from(offerTags.map((x) => x)),
        "category": category,
        "offerType": List<dynamic>.from(offerType.map((x) => x)),
        "code": code,
        "isAvailable": isAvailable,
        "vendor": vendor,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "quantity": quantity,
        "offerDishes":List<dynamic>.from(offerDishes.map((x) => x)),
        "price": price,
        "__v": v,
    };
}
