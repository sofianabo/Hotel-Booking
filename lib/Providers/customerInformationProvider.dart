import 'package:flutter/cupertino.dart';

class customerInformationProvider extends ChangeNotifier{
  String name = '';
  String username= '';
  String imageid = '';
  setUserInfo(String Name,String userName,String Imageid) {
    name = Name;
    username=userName;
    imageid =Imageid;
    notifyListeners();
  }
}