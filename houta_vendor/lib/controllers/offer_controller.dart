import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OfferController extends GetxController{
  String _category ='';
  String get category =>_category;

  set setCategory(String newValue){
    _category = newValue;
    print(category);
  }
// types
  RxList<String> _types = <String>[].obs;
  RxList<String> get types => _types;

  set setTypes(String newValue){
    _types.add(newValue);
  }
  // tags
   RxList<String> _tags = <String>[].obs;
  RxList<String> get tags => _tags;

  set setTags(String newValue){
    _tags.add(newValue);
  }
  String _isAvailable ='false';
  String get isAvailable =>_isAvailable;

  set setisAvailable(String newValue){
    _isAvailable = newValue;
    print(category);
  }
}