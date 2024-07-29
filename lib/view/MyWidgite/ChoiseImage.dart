import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/_http/_html/_file_decoder_html.dart';
import 'package:hotel/Providers/ImageProvider.dart';
import 'package:hotel/view/SplashScreen/SaveImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';



 choisimage(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
   var image = await picker.pickImage(source: ImageSource.gallery);
  if (image!.path.isNotEmpty) {
    Provider.of<Imageprovider>(context,listen: false).Addimage(File(image!.path));


    saveImage(image,context);
  }
}