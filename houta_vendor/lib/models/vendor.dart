import 'dart:convert';

List<VendorsModel> vendorsModelFromJson(String str) => List<VendorsModel>.from(json.decode(str).map((x) => VendorsModel.fromJson(x)));

String vendorsModelToJson(List<VendorsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendorsModel {
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final List<dynamic> offers;
    final bool pickup;
    final bool delivery;
    final bool isAvailable;
    final String owner;
    final String code;
    final String logoUrl;
    final int rating;
    final String ratingCount;
    final String verification;
    final String verificationMessage;
    final Coords coords;

    VendorsModel({
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.offers,
        required this.pickup,
        required this.delivery,
        required this.isAvailable,
        required this.owner,
        required this.code,
        required this.logoUrl,
        required this.rating,
        required this.ratingCount,
        required this.verification,
        required this.verificationMessage,
        required this.coords,
    });

    factory VendorsModel.fromJson(Map<String, dynamic> json) => VendorsModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        offers: List<dynamic>.from(json["offers"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailable: json["isAvailable"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        coords: Coords.fromJson(json["coords"]),
    );

    Map<String, dynamic> toJson() => {
    };
}

class Coords {
    final String id;
    final double latitude;
    final double longitude;
    final String address;
    final String title;
    final double latitudeDelta;
    final double longitudeDelta;

    Coords({
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.address,
        required this.title,
        required this.latitudeDelta,
        required this.longitudeDelta,
    });

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
        latitudeDelta: json["latitudeDelta"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
    };
}
