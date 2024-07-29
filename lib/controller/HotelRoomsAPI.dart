import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/HotelHomeScreenModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/HotelHomeScreen_Provider.dart';
import 'api.dart' as global;

class hotelRoomsAPI {
  hotelRoomsAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  hotelRooms() async {
    String jsonData = '''
    {
      "state": true,
      "roomCount": 10,
      "rooms": [
        {
          "id": 1,
          "roomNumber": 1,
          "isBooked": false
        },
        {
          "id": 2,
          "roomNumber": 2,
          "isBooked": true
        },
        {
          "id": 3,
          "roomNumber": 3,
          "isBooked": false
        },
         {
          "id": 4,
          "roomNumber": 4,
          "isBooked": true
        },
         {
          "id": 5,
          "roomNumber": 5,
          "isBooked": true
        },
         {
          "id": 6,
          "roomNumber": 6,
          "isBooked": false
        },
         {
          "id": 7,
          "roomNumber": 7,
          "isBooked": false
        },
         {
          "id": 8,
          "roomNumber": 8,
          "isBooked": false
        },
         {
          "id": 9,
          "roomNumber": 9,
          "isBooked": false
        },
         {
          "id": 10,
          "roomNumber": 10,
          "isBooked": false
        }
      ]
    }
  ''';
        Map<String, dynamic> jsonMap = json.decode(jsonData);
        HotelHomeScreenModel HHSModel = HotelHomeScreenModel.fromJson(jsonMap);
        Provider.of<HotelHomeScreenProvider>(context , listen: false).RoomsHome(HHSModel.roomCount, HHSModel.rooms);

  }
}
