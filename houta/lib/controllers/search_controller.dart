// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/models/api_error.dart';
import 'package:houta/models/offers_model.dart';
import 'package:http/http.dart' as http;

class SearchOfferController extends GetxController{
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value){
    _isLoading.value = value;
  }

   RxBool _isTriggered = false.obs;
  bool get isTriggered => _isTriggered.value;

  set setTrigger(bool value){
    _isTriggered.value = value;
  }

  List<OffersModel>? searchResults;

  void searchOffers(String key)async{
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/api/offers/search/$key");
    try {
      var response = await http.get(url);
      
      if(response.statusCode == 200){
        searchResults = offersModelFromJson(response.body);
        setLoading = false;
      }else{
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}