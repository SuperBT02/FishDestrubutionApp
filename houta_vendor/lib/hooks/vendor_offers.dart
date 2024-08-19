import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/models/hook_models/hook_result.dart';
import 'package:houta_vendor/models/offers.dart';
import 'package:http/http.dart' as http;
import '../models/api_error.dart';

FetchHook useFetchOfferByVendors(String name) {
  
  final offersItems = useState<List<OffersModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    final headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjRlMjM4YWIzMjE0MGM5NGY1YjU5ZCIsInVzZXJUeXBlIjoiVmVuZG9yIiwiZW1haWwiOiJyYXllbmJvdWJ0YW5lNzFAZ21haWwuY29tIiwiaWF0IjoxNzEwNTUyODc2LCJleHAiOjE3MTMxNDQ4NzZ9.G23j7DOY2zFnOeEJzIEdhfMnnpy_mEb-hkdO_PAAeOA',
  };

    try {
      Uri url = Uri.parse('$appBaseUrl/api/offers/vendor/offers/$name');
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
