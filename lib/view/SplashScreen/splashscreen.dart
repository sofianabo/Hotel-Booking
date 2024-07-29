
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel/controller/GetHotelHomeScreen.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/controller/HotelRoomsAPI.dart';
import 'package:hotel/view/HomeScreen/MainHomeScreen.dart';
import 'package:hotel/view/HotelScreen/MainHotelScreen.dart';
import 'package:hotel/view/SplashScreen/LoginAndRegister.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Providers/customerInformationProvider.dart';
import '../../controller/AllHotelAPI.dart';




class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  cheeckuser()async{
    await Future.delayed(Duration(seconds: 4));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Islogin  = await prefs.getString("Islogin");
    String? rool = await prefs.getString("rool");
    if(Islogin == "true"){
      String? Name = await prefs.getString("Name");
      String? username = await prefs.getString("username");
      String? imageid = await prefs.getString("imageid");
      String? token = await prefs.getString("Token");
      print(token);
      Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Name}","${username}","$imageid");
      if(rool == "user"){
        await GetWallet(context).getWallet();
       await allHotelAPI(context).allHotel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else if(rool == "hotel"){
        await GetHotelHomeScreen(context).getHotelHomeScreen();
        await hotelRoomsAPI(context).hotelRooms();
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainHotelHomeScreen(),));
      }
    }
    else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
    }
  }
  initState() {
    super.initState();
    cheeckuser();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            children: [
              Text("OTELI",style: TextStyle(color: Color(0xff3D36A4),fontSize: 24),),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage("images/logo.jpg"),
                          fit: BoxFit.fill
                        )
                      ),
                    ).animate(onPlay: (controller) => controller.repeat()).shimmer(delay: Duration(milliseconds: 500),duration: Duration(milliseconds: 500)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
