import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploaderController extends GetxController{
  final ImagePicker _picker = ImagePicker();
  var imageOne = Rxn<File>();
  String _image = '';
  String get image =>_image;
  set setImages(String newValue){
    _image=newValue;
  }
  RxString _imageOneUrl = ''.obs;
  String get imageOneUrl =>_imageOneUrl.value;
  set setimageOneUrl(String newValue){
    _imageOneUrl.value=newValue;
     _image = newValue;
  }


  Future<void> pickImage()async{
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      imageOne.value = File(pickedImage.path);
      uploadImageToFirebase();
      print('image uploaded');
      return;
    }
  }


  Future<void> uploadImageToFirebase()async{
    try {
      String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${imageOne.value!.path.split('/').last}';
      TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(imageOne.value!);
      setimageOneUrl = await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}