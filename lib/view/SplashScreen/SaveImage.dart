
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel/Providers/ImageProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
String? base64Image;

saveImage( imageBytes, BuildContext context) async {
  final imageBytess = await imageBytes.readAsBytes();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  base64Image = base64Encode(imageBytess);
  print("Saved");
  prefs.setString("Profile", base64Image!);
  await GetPicture(context);
}

GetPicture(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? dataIsGet = prefs.getString('Profile');
  if (dataIsGet != null) {
    print("get");
    Provider.of<Imageprovider>(context, listen: false).Addimage(File(dataIsGet));
  } else {
    print("No data found in SharedPreferences");
  }
}







