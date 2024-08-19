import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/models/api_error.dart';
import 'package:houta_vendor/models/login_response.dart';
import 'package:houta_vendor/views/auth/verification_page.dart';
import 'package:houta_vendor/views/home/home_page.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController{
  final box= GetStorage();
    RxBool _isLoading = false.obs;
    bool get isLoading => _isLoading.value;
    set setLoading(bool newState){
      _isLoading.value = newState;
    }
    void loginFunction(String data)async{
      setLoading =true;
      Uri url = Uri.parse('$appBaseUrl/login');
      Map<String, String> headers = {'Content-Type':'application/json'};
      try{
        var response = await http.post(
          url,
          headers:headers,
          body: data,
        );
        print(response.statusCode);
        if(response.statusCode ==200){
          LoginResponse data = loginResponseFromJson(response.body);
          String userId = data.id;
          String userData = jsonEncode(data);

          box.write(userId, userData);
          box.write("token", data.userToken);
          box.write("userId", data.id);
          box.write("verification", data.verification);
          box.write("username", data.username);

          setLoading = false;
          Get.snackbar("You are Successfully logged in", "Enjoy Your Fresh Fish",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.cart_outline));

          if(data.verification == false){
            Get.to(()=>const VerificationPage(),
            transition: Transition.fade,
            duration: const Duration(microseconds: 900));
          }
        if(data.verification == true){
          Get.offAll(()=>HomePage(),
          transition: Transition.fade,
            duration: const Duration(microseconds: 900));
            }
        }else{
          var error = apiErrorFromJson(response.body);
          Get.snackbar("Failed to login", error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline));
        }
      }catch (e){
            debugPrint(e.toString());
      }
    }


    void logout(){
      box.erase();
      Get.offAll(()=>HomePage(),
          transition: Transition.fade,
            duration: const Duration(microseconds: 900));
    }


    LoginResponse? getUserInfo(){
      String? userId = box.read("userId");
      String? data;
      if(userId != null){
        data = box.read(userId.toString());
      }
      if(data!= null){
        return loginResponseFromJson(data);
      }
      return null;
    }

}