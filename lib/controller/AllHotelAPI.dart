import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/AllHotelsModel.dart';
import 'package:provider/provider.dart';
import '../Providers/allHotelProvider.dart';

class allHotelAPI {
  allHotelAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  allHotel() async {
    String jsonData = '''
    {
      "state": true,
      "data": [
        {
          "locationDetail": "Hotel location",
          "userId": 1,
          "isFav": true,
          "imageId": 2,
          "name": "Four Seasons Hotel",
          "minPrice": "1500000",
          "rate": 5,
          "location": {
            "country": "SYRIA",
            "city": "Damascus"
          },
          "isOffer": false
        },
           {
          "locationDetail": "Swidaa Qanawat Street",
          "userId": 2,
          "isFav": false,
          "imageId": 3,
          "name": "Burj Alreem Hotel",
          "minPrice": "200000",
          "rate": 4,
          "location": {
            "country": "SYRIA",
            "city": "Swidaa"
          },
          "isOffer": true
        },
         {
          "locationDetail": "Before Abu Abdo Street",
          "userId": 3,
          "isFav": false,
          "imageId": 4,
          "name": "Sheraton Hotel",
          "minPrice": "800000",
          "rate": 3,
          "location": {
            "country": "SYRIA",
            "city": "Tartous"
          },
          "isOffer": true
        }
      ]
    }
  ''';
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    AllHotelModel allHotelModel = AllHotelModel.fromJson(jsonMap);
      Provider.of<allHotelProvider>(context,listen: false).setAllHotel(allHotelModel.data);
  }
}
