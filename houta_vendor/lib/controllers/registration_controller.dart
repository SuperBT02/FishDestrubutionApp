import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/models/api_error.dart';
import 'package:houta_vendor/models/success_model.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController{
    final box= GetStorage();
    RxBool _isLoading = false.obs;
    bool get isLoading => _isLoading.value;
    set setLoading(bool newState){
      _isLoading.value = newState;
    }
    void RegistrationFunction(String data)async{
      setLoading =true;
      Uri url = Uri.parse('$appBaseUrl/register');
      Map<String, String> headers = {'Content-Type':'application/json'};
      try{
        var response = await http.post(
          url,
          headers:headers,
          body: data,
        );
        if(response.statusCode ==201){
          var data = successModelFromJson(response.body);

          setLoading = false;
          Get.back();
          Get.snackbar("You are Successfully Registred", data.message,
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.cart_outline));
        }else{
          var error = apiErrorFromJson(response.body);
          Get.snackbar("Failed to Register", error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline));
        }
      }catch (e){
            debugPrint(e.toString());
      }
    }
}