import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/RoomTypesModel.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;

class roomsDetialsHotelAPI {
  roomsDetialsHotelAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  roomDetialsHotel() async {
    String jsonData = '''
    {
  "state": true,
  "data": ["Sweet", "Studio"]
}
  ''';
    Map<String, dynamic> jsonMap = json.decode(jsonData);
      RoomTypesModel model = RoomTypesModel.fromJson(jsonMap);
      Provider.of<RoomTypesProvider>(context,listen: false).RoomTypes(model.data);

  }
}
