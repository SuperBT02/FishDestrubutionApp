import 'package:houta/constants/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta/models/offers_model.dart';
import 'package:http/http.dart' as http;
import '../models/api_error.dart';
import '../models/hook models/hook_result.dart';

FetchHook useFetchOfferByVendors(String id) {
  final offersItems = useState<List<OffersModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    final headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MDRjMTIwZjFiYjA0NGE3NmFhYWVkYSIsInVzZXJUeXBlIjoiVmVuZG9yIiwiZW1haWwiOiJyYXllbmJvdWJ0YW5lNzFAZ21haWwuY29tIiwiaWF0IjoxNzE1NzI2NTM4LCJleHAiOjE3MTgzMTg1Mzh9.bcM8rOTZgr51IRNlH2X9VdMPxh_6tUDA0RG_IKQb96s',
  };

    try {
      Uri url = Uri.parse('$appBaseUrl/api/offers/vendor/$id');
      final response = await http.get(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        offersItems.value = offersModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      //error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: offersItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
