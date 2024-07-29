import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/RoomNumperDetail.dart';
import 'package:hotel/Providers/RoomDertailProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/HotelScreen/UpdateRoom.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class RoomDetailAPI {
  RoomDetailAPI(this.context);
  BuildContext context;
  roomDetailAPI(int roomid) async {
     if(roomid == 2 || roomid == 4 || roomid==5){
       String jsonData = '''
    {
      "state": true,
      "roomDetail": {
        "roomNumber": $roomid,
        "type": "Sweet",
        "price": "500000"
      },
      "bookings": [
        {
          "startDate": "2024-12-01",
          "endDate": "2024-12-03"
        },
        {
          "startDate": "2025-12-10",
          "endDate": "2025-12-15"
        }
      ]
    }
  ''';

       Map<String, dynamic> jsonMap = json.decode(jsonData);
       RoomNumperDetail roomdetail = RoomNumperDetail.fromJson(jsonMap);
       Provider.of<RoomDertailProvider>(context , listen: false).Setdate(roomdetail.roomDetail!, roomdetail.bookings!);
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateRoom(Tex: '180000',),));
     }else{
       String jsonData = '''
    {
      "state": true,
      "roomDetail": {
        "roomNumber": $roomid,
        "type": "Studio",
        "price": "500000"
      },
      "bookings": []
    }
  ''';

       Map<String, dynamic> jsonMap = json.decode(jsonData);
       RoomNumperDetail roomdetail = RoomNumperDetail.fromJson(jsonMap);
       Provider.of<RoomDertailProvider>(context , listen: false).Setdate(roomdetail.roomDetail!, roomdetail.bookings!);
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateRoom(Tex: '${roomdetail.roomDetail!.price}',),));
     }
     }
}
