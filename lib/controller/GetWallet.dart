import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Providers/MyWallet_Provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetWallet {
  GetWallet(this.context);
  BuildContext context;
  Dio dio = Dio();
  getWallet() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("mony", "50000000");
          Provider.of<WalletProvider>(context , listen: false).ChargeWallet(double.parse(("${prefs.get("mony")}").toString()));
  }
}