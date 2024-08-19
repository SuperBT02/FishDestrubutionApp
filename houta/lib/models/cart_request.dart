// To parse this JSON data, do
//
//     final cartrequest = cartrequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartRequest cartRequestFromJson(String str) => CartRequest.fromJson(json.decode(str));

String cartRequestToJson(CartRequest data) => json.encode(data.toJson());

class CartRequest {
   String? vendor_id;
    final String productId;
    final int quantity;
    final double totalPrice;

    CartRequest({
      this.vendor_id,
        required this.productId,
        required this.quantity,
        required this.totalPrice,
    });

    factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        productId: json["productId"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"]?.toDouble(),
        vendor_id: json["vendor_id"]
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "totalPrice": totalPrice,
        "vendor_id": vendor_id ?? ""
    };
}
