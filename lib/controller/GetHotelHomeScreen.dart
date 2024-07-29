import 'package:flutter/material.dart';
import 'package:hotel/Providers/HotelHomeScreen_Provider.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:provider/provider.dart';
import '../Providers/HotelRoomsProvider.dart';


class GetHotelHomeScreen{
  BuildContext context;
  GetHotelHomeScreen(this.context);
  getHotelHomeScreen()async{
        Provider.of<HotelRoomsProvider>(context , listen: false).setHotelRooms(
            "10",
            "This Is A Hotel Detail",
            "Hotel location",
            1,
           true,
            2,
            "Four Seasons Hotel",
            "150000",
           "5",
            "SYRIA",
           "Damascus",
            null
        );
        Provider.of<RoomTypesProvider>(context,listen: false).HomeScreenHotel(["Sweets" , "Studio"]);
        Provider.of<HotelHomeScreenProvider>(context,listen: false).Setprivid([5,8]);
  }
}