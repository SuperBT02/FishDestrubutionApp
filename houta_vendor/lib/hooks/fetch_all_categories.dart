import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/models/categories.dart';
import 'package:houta_vendor/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;

import '../models/api_error.dart';

FetchHook useFetchAllCategories(){
  final categoriesItems = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value= true;

    try {
      Uri url =Uri.parse('$appBaseUrl/api/category');
      final response = await http.get(url);
      
      if(response.statusCode == 200){
        categoriesItems.value = categoriesModelFromJson(response.body);
      }else{
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    }finally{
      isLoading.value = false;
    }
  }

  useEffect((){
    fetchData();
    return null;
  }, []);

  void refetch(){
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: categoriesItems.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
    );
}