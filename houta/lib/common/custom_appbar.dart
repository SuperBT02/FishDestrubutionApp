import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/user_location_controller.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      height: 110,
      width: width,
      color: kLightWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: kSecondary,
                  backgroundImage: NetworkImage(
                      "https://media.routard.com/image/75/1/pt21967.1233751.w430.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: "Located In",
                          style: appStyle(12.0, kSecondary, FontWeight.w600)),
                      Obx(
                        () => SizedBox(
                          width: width * 0.65,
                          child: Text(
                              controller.address == ""
                                  ? 'Tunisie ,Sud-Est'
                                  : controller.address,
                                  overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: kGrayLight,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  "☁️",
                  style: TextStyle(fontSize: 26),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _getCurrentLocation();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  Future<void> _getCurrentLocation() async {
   final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
     LatLng currentLocation =LatLng(position.latitude, position.longitude);
    // LatLng(latitude, longitude);
     /* double latitude = position.latitude;
     double longitude = position.longitude; */
     /* String locationName = await getLocationName(latitude, longitude); */
     controller.SetPosition(currentLocation);
     controller.getLocationName(currentLocation);
    /*  print(locationName);
    return locationName; */
    // controller.SetPosition(currentLocation);
   // controller.getUserAddress(currentLocation); */
 }
/*  Future<String> getLocationName(double latitude,double longitude) async {
  final url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';
  final headers = {
    'Accept-Language': 'en-US,en;q=0.9', // Specify English language
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
       final address = decodedResponse['address'];
      final city = address['city'] ?? '';
      final state = address['state'] ?? '';
      final country = address['country'] ?? '';

      return '$city, $state, $country';
    }
    return 'Unknown Location';
  } catch (e) {
    print('Error fetching location: $e');
    return 'Unknown Location';
  }
} */

}
