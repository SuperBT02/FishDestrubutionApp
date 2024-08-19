import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:houta/constants/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta/models/hook%20models/vendor_hook.dart';
import 'package:houta/models/vendors_model.dart';
import 'package:http/http.dart' as http;
import '../models/api_error.dart';


FetchVendor useFetchVendorr(String codee) {
  final vendorsItem = useState<VendorsModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    final headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjRlMjM4YWIzMjE0MGM5NGY1YjU5ZCIsInVzZXJUeXBlIjoiVmVuZG9yIiwiZW1haWwiOiJyYXllbmJvdWJ0YW5lNzFAZ21haWwuY29tIiwiaWF0IjoxNzEwNTUyODc2LCJleHAiOjE3MTMxNDQ4NzZ9.G23j7DOY2zFnOeEJzIEdhfMnnpy_mEb-hkdO_PAAeOA',
  };
print("vendorId: $codee");
    try {
      Uri url = Uri.parse('$appBaseUrl/api/vendor/byId/$codee');
      final response = await http.get(url, headers :headers);
      print(response.statusCode);
              print("response body:${response.body}");

      if (response.statusCode == 200) {
        var vendor = jsonDecode(response.body);
        print("response body200:${response.body}");
        vendorsItem.value = VendorsModel.fromJson(vendor);

      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchVendor(
    data: vendorsItem.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
