import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Notification_Model.dart';

class NotificationProvider extends ChangeNotifier{
  int? counter =0;
  List<Map<String, dynamic>> Notifications = [
    ];
  AddCountNotification(int counte) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(counte == 0){
      counter = 0;
     await prefs.setString("notification", "$counter");
    }
    else{
      counter = counter! + 1 ;
      await prefs.setString("notification", "$counter");

    }
    notifyListeners();
  }
  getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? noti = await prefs.getString("notification");
    counter = int.parse(noti!);
    notifyListeners();
  }
  SetData(String name , rooms , String date ,String dateend){

    Notifications.add(
      {"name": "$name",
        "roomNumber": rooms ,
        "startDate": date.replaceAll("00:00:00.000", ""),
        "endDate": dateend.replaceAll("00:00:00.000", "")},
    );
    notifyListeners();
  }

}