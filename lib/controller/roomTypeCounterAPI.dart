import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/RoomTypesCounterModel.dart';
import 'package:hotel/Models/RoomTypesModel.dart';
import 'package:hotel/Providers/roomTypeCounterProvider.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:hotel/view/MyWidgite/Loading.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;

class roomTypeCounterAPI {
  roomTypeCounterAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  roomTypeCounter(int id ,String type) async {
    if(type == "Sweet"){

      String jsonData = '''
   {
  "state": true,
  "data": {
    "roomsCount": 10,
    "rooms": [
      {
        "id": 1,
        "roomNumber": 1,
        "price": "800000"
      },
      {
        "id": 2,
        "roomNumber": 2,
        "price": "800000"
      },
      {
        "id": 3,
        "roomNumber": 3,
        "price": "800000"
      },
      {
        "id": 4,
        "roomNumber": 4,
        "price": "800000"
      },
      {
        "id": 5,
        "roomNumber": 5,
        "price": "800000"
      },
      {
        "id": 6,
        "roomNumber": 6,
        "price": "800000"
      },
      {
        "id": 7,
        "roomNumber": 7,
        "price": "800000"
      },
      {
        "id": 8,
        "roomNumber": 8,
        "price": "800000"
      },
      {
        "id": 9,
        "roomNumber": 9,
        "price": "1500000"
      },
      {
        "id": 10,
        "roomNumber": 10,
        "price": "900000"
      }
    ]
  }
}

  ''';
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      RoomTypesCounterModel model = RoomTypesCounterModel.fromJson(jsonMap);
      Provider.of<roomTypeCounterProvider>(context, listen: false)
          .roomTypeCounter(model);

    } else{

  String jsonData = '''
   {
  "state": true,
  "data": {
    "roomsCount": 6,
    "rooms": [
      {
        "id": 11,
        "roomNumber": 11,
        "price": "800000"
      },
      {
        "id": 12,
        "roomNumber": 12,
        "price": "800000"
      },
      {
        "id": 13,
        "roomNumber": 13,
        "price": "800000"
      },
      {
        "id": 14,
        "roomNumber": 14,
        "price": "800000"
      },
      {
        "id": 15,
        "roomNumber": 15,
        "price": "800000"
      },
      {
        "id": 16,
        "roomNumber": 16,
        "price": "800000"
      }
    ]
  }
}

  ''';
  Map<String, dynamic> jsonMap = json.decode(jsonData);

  RoomTypesCounterModel model = RoomTypesCounterModel.fromJson(jsonMap);
  Provider.of<roomTypeCounterProvider>(context, listen: false)
      .roomTypeCounter(model);

    }
  }
}
