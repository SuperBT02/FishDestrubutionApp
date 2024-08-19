import 'package:houta/constants/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta/models/vendors_model.dart';
import 'package:http/http.dart' as http;
import '../models/api_error.dart';
import '../models/hook models/hook_result.dart';

FetchHook useFetchAllVendor(String codee) {
  final vendorsItem = useState<List<VendorsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    final headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MDRjMTIwZjFiYjA0NGE3NmFhYWVkYSIsInVzZXJUeXBlIjoiVmVuZG9yIiwiZW1haWwiOiJyYXllbmJvdWJ0YW5lNzFAZ21haWwuY29tIiwiaWF0IjoxNzE1NzI2NTM4LCJleHAiOjE3MTgzMTg1Mzh9.bcM8rOTZgr51IRNlH2X9VdMPxh_6tUDA0RG_IKQb96s',
  };

    try {
      Uri url = Uri.parse('$appBaseUrl/api/vendor/all/$codee');
      final response = await http.get(url, headers :headers);
      if (response.statusCode == 200) {
        vendorsItem.value = vendorsModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
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

  return FetchHook(
    data: vendorsItem.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
