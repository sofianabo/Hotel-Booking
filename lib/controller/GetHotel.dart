import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/AllHotelsModel.dart';
import 'package:hotel/Providers/SetRateProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/controller/HotelRoomsTypes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/HotelDetailsModel.dart';
import '../Providers/HotelRoomsProvider.dart';
import '../view/HotelScreen/Detail_Hotel_User.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class GetHotel{
  BuildContext context;
  GetHotel(this.context);
  getHotel(String hotelid ,String Herotag, int heroindex , int rate, bool isoffer )async{

      if(hotelid == "1"){
        Provider.of<HotelRoomsProvider>(context , listen: false).setDate(null,null);
        Provider.of<HotelRoomsProvider>(context , listen: false).setHotelRooms(
            (10).toString(),
            "Four Seasons Hotel",
            "Four Seasons Hotel Locations Detail",
            1,
            true,
            2,
            "Four Seasons Hotel",
            "150000",
            5,
            "SYRIA".toString(),
            "Damascus".toString(),
            [0]
        );
        Provider.of<SetRateProvider>(context , listen: false).setrate(4);
      }else if(hotelid == "2"){
        Provider.of<HotelRoomsProvider>(context , listen: false).setDate(null,null);
        Provider.of<HotelRoomsProvider>(context , listen: false).setHotelRooms(
            (50).toString(),
            "Burj Alreem Hotel",
            "Burj Alreem Hotel Locations Detail",
            2,
            false,
            3,
            "Burj Alreem Hotel",
            "150000",
            4,
            "SYRIA".toString(),
            "Swidaa".toString(),
            [0]
        );
        Provider.of<SetRateProvider>(context , listen: false).setrate(2);
      }else{
        Provider.of<HotelRoomsProvider>(context , listen: false).setDate("2024-4-8","2024-4-18");
        Provider.of<HotelRoomsProvider>(context , listen: false).setHotelRooms(
            (5).toString(),
            "Sheraton Hotel Detail",
           "Sheraton Hotel Locations Detail",
            3,
           false,
            4,
           "Sheraton Hotel",
           "800000",
            3,
            "SYRIA".toString(),
            "Tartous".toString(),
            [0]
        );
        Provider.of<SetRateProvider>(context , listen: false).setrate(5);
      }
        int ratee = Provider.of<HotelRoomsProvider>(context,listen: false).rate == null?0:Provider.of<HotelRoomsProvider>(context,listen: false).rate;
        Provider.of<allHotelProvider>(context,listen: false).setRate(ratee, heroindex);
        await roomsDetialsHotelAPI(context).roomDetialsHotel();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Detile_Hotel(Herotag: Herotag, index: heroindex,hotelid: int.parse((hotelid).toString())),
        ));

  }
}