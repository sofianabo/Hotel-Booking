import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/view/MyWidgite/Loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/allHotelProvider.dart';
import 'api.dart' as global;

class FavouriteAPIs {
  FavouriteAPIs(this.context);
  BuildContext context;
  Dio dio = Dio();
  addFavourite(int Dataindex) async {
          Provider.of<allHotelProvider>(context , listen:  false).setFav(Dataindex,true);
  }


  DeleteFavourite(int dataindex) async {
    {
      Provider.of<allHotelProvider>(context , listen:  false).setFav(dataindex,false);
    }
}
}