import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Providers/DateProvider.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/Wallet/SelectedPay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class RoomTotalAPI {
  RoomTotalAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  RoomTotal(int days , List<String> roomid) async {
    if (roomid.isNotEmpty && days>0) {
           var roo = roomid.length * 500000 * days;
          Provider.of<DateProvider>(context , listen: false).ChangeSallary(double.parse((roo).toString()));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectPay(),));

    } else {
      Showsnack(context,"","Not Allow Null Value",Colors.redAccent,Colors.green,false);
    }
  }
}