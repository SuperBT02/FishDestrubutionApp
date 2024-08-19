import 'package:flutter/material.dart';
import 'package:houta/models/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta/constants/constants.dart';

class CartController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

    Future<bool>confirmCart(String userId)async{
    final response = await http.post(Uri.parse("$appBaseUrl/api/cart/confirm/$userId"));
    if(response.statusCode == 200){
        return true;
    }else{
      return false;
    }
  }

  void addToCart(String cart) async {
    setLoading = true;
    String? accessToken = box.read("token");
    var url = Uri.parse("$appBaseUrl/api/cart");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: cart);
      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar("Added to Cart", "Enjoy your awesome experience",
            colorText: kLightWhite,
            snackPosition: SnackPosition.TOP,
            backgroundColor: kPrimary,
            icon: const Icon(Icons.check_circle_outline, color: kLightWhite));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Error", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(
              Icons.error_outline,
              color: kLightWhite,
            ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      setLoading = false;
    }
  }
  void RemoveFromCart(String ProductId, Function refetch) async {
    setLoading = true;
    String accessToken = box.read("token");
    var url = Uri.parse("$appBaseUrl/api/cart/$ProductId");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        setLoading = false;
        refetch();


        Get.snackbar("Product removed Successfully", "Enjoy Houta",
            colorText: kLightWhite,
            snackPosition: SnackPosition.TOP,
            backgroundColor: kPrimary,
            icon: const Icon(Icons.check_circle_outline, color: kLightWhite));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Error", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(
              Icons.error_outline,
              color: kLightWhite,
            ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      setLoading = false;
    }
  }
}

