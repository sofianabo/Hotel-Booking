import 'package:flutter/material.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:hotel/controller/GetHotelHomeScreen.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/controller/HotelRoomsAPI.dart';
import 'package:hotel/view/HotelScreen/MainHotelScreen.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/customerInformationProvider.dart';
import '../view/HomeScreen/MainHomeScreen.dart';


class LoginAccount{
  BuildContext context;
  LoginAccount(this.context);
  loginAccount(String userName , String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

       if(userName == "user" && password == "user"){
         await prefs.setString("Name", "Laith Haitham Azzam");
         await prefs.setString("username", "Laith Haitham Azzam");
         await prefs.setString("Islogin", "true");
         await prefs.setString("rool", "user");
         await prefs.setString("imageid", "20");
         await GetWallet(context).getWallet();
         await allHotelAPI(context).allHotel();
         Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("Laith Haitham Azzam","LaithHaithamAzzam","20");
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
       } else
         if(userName == "hotel" && password == "hotel"){
         await prefs.setString("Name", "Four Seasons Hotel");
         await prefs.setString("username", "Four Seasons");
         await prefs.setString("Islogin", "true");
         await prefs.setString("rool", "hotel");
         await prefs.setString("imageid", "2");
         Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("Four Seasons Hotel","Four Seasons","2");
         await GetHotelHomeScreen(context).getHotelHomeScreen();
         await hotelRoomsAPI(context).hotelRooms();
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHotelHomeScreen(),),(route) => false,);
       }else{
           showSnackBar(context, "UserName Or Password Is Not True", Colors.redAccent, false);
         }
  }
}