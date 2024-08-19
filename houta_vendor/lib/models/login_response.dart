// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    final bool verification;
    final String profile;
    final String id;
    final String username;
    final String email;
    final String fcm;
    final String phone;
    final bool phoneVerification;
    final String userType;
    final String userToken;

    LoginResponse({
        required this.verification,
        required this.profile,
        required this.id,
        required this.username,
        required this.email,
        required this.fcm,
        required this.phone,
        required this.phoneVerification,
        required this.userType,
        required this.userToken,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        verification: json["verification"],
        profile: json["profile"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        fcm: json["fcm"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        userToken: json["userToken"],
    );

    Map<String, dynamic> toJson() => {
        "verification": verification,
        "profile": profile,
        "_id": id,
        "username": username,
        "email": email,
        "fcm": fcm,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "userToken": userToken,
    };
}
