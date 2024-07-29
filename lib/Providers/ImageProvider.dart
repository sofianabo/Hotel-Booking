import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Imageprovider extends ChangeNotifier{
  File? image;
  Addimage(File IMAGES){
    image = IMAGES;

    notifyListeners();
  }

}






