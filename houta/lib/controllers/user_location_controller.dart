import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:houta/constants/constants.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController{
  LatLng position = const LatLng(0, 0);
 // LatLng position = const LatLng(0, 0);
  void SetPosition(LatLng value){
    value = position;
    update();

  }
  RxString _address =''.obs;
  String get address => _address.value;

  set setAddress(String value){
    _address.value = value;
  }
  RxString _postalCode =''.obs;
  String get postalCode =>_postalCode.value;

  set setPostalCode(String value){
    _postalCode.value = value;
  }
  /* void getUserAddress(LatLng position)async{
    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey');

    final response = await http.get(url);
    if(response.statusCode == 200){
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      final address = responseBody['results'][0]['formatted_address'];
      setAddress = address;
      final addressComponents = responseBody['results'][0]['address_components'];
      for (var component in addressComponents){
        if(component['types'].contains('postal_code')){
          setPostalCode = component['long_name'];
        }
      }
    }

  } */
   Future<void> getLocationName(LatLng position) async {
  final url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}&zoom=18&addressdetails=1';
  final headers = {
    'Accept-Language': 'en-US,en;q=0.9', // Specify English language
  };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
       final address = decodedResponse['address'];
       final city = address['city'] ?? '';
      final state = address['state'] ?? '';
      final country = address['country'] ?? '';
       setAddress = ('$city,$state,$country');
      final postalCode= address['postalcode'] ?? '';
      setPostalCode = postalCode;
      

    }
  }
}




