import 'package:flutter/material.dart';
import 'package:hotel/view/SplashScreen/LoginAndRegister.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Logout {
  Logout(this.context);
  BuildContext context;
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
    await prefs.clear();
  }
}