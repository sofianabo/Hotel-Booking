import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/customerInformationProvider.dart';
import '../view/HomeScreen/MainHomeScreen.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class CreateAccount{
  BuildContext context;
CreateAccount(this.context);
  createAccount(String name , String userName , String password ,File image)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("Name", "$name");
        await prefs.setString("username", "${userName}");
        await prefs.setString("Islogin", "true");
        await prefs.setString("rool", "user");
        await prefs.setString("imageid", "20");
        await GetWallet(context).getWallet();
        await allHotelAPI(context).allHotel();
        Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${name}","$userName","20");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
  }
}