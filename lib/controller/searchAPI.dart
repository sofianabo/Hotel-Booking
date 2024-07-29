import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Models/AllHotelsSerchModel.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/HomeScreen/HotelsSerch.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class SearchAPI {
  SearchAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  searchcustom(String? country, String? city, int price) async {
    if(country!.isEmpty && city!.isEmpty && price == 0){
      Navigator.of(context).pop();
      showSnackBar(context, "Not Allow Null Serch", Colors.redAccent, false);
    }else{

      if(country =="SYRIA"){
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
          "isOffer": false
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
        AllHotelsSerchModel serchmod = AllHotelsSerchModel.fromJson(jsonMap);
        Provider.of<SerchProvider>(context,listen: false).ResDataSerch(serchmod.data);
        Provider.of<SerchProvider>(context,listen: false).Setstate(true);
      } else if(city == "Tartous"|| price >= 800000){
        String jsonData = '''
    {
      "state": true,
      "data": [
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
        AllHotelsSerchModel serchmod = AllHotelsSerchModel.fromJson(jsonMap);
        Provider.of<SerchProvider>(context,listen: false).ResDataSerch(serchmod.data);
        Provider.of<SerchProvider>(context,listen: false).Setstate(true);
      }else if(city == "Damascus" || price >=1500000){
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
          "isOffer": false
        }
      ]
    }
  ''';
        Map<String, dynamic> jsonMap = json.decode(jsonData);
        AllHotelsSerchModel serchmod = AllHotelsSerchModel.fromJson(jsonMap);
        Provider.of<SerchProvider>(context,listen: false).ResDataSerch(serchmod.data);
        Provider.of<SerchProvider>(context,listen: false).Setstate(true);
      }else if(city == "Swidaa" || price >=200000){
        String jsonData = '''
       {
      "state": true,
      "data": [
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
          "isOffer": false
        }
      ]
    }
  ''';
        Map<String, dynamic> jsonMap = json.decode(jsonData);
        AllHotelsSerchModel serchmod = AllHotelsSerchModel.fromJson(jsonMap);
        Provider.of<SerchProvider>(context,listen: false).ResDataSerch(serchmod.data);
        Provider.of<SerchProvider>(context,listen: false).Setstate(true);
      }

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelSerch(),));
    }
  }
}
