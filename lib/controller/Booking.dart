import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/HotelRoomsProvider.dart';
import 'package:hotel/Providers/MyWallet_Provider.dart';
import 'package:hotel/Providers/NotificationProvider.dart';
import 'package:hotel/Providers/SelectRoomsProvider.dart';
import 'package:hotel/view/HomeScreen/Notification.dart';
import 'package:hotel/view/HotelScreen/DoneBooking.dart';
import 'package:provider/provider.dart';


class BookingAPI {
  BookingAPI(this.context);
  BuildContext context;
  Booking(String startdate, String enddate , List<String> roomid , double total) async {
    Provider.of<NotificationProvider>(context , listen: false).SetData(Provider.of<HotelRoomsProvider>(context , listen: false).name.toString() , Provider.of<SelectRoomsProvider>(context,listen: false).Rooms ,startdate,enddate);
    NotificationService.showNotification("successful Booking Room".tr,"Your Room IS".tr+" ${Provider.of<SelectRoomsProvider>(context,listen: false).Rooms}");
    Provider.of<NotificationProvider>(context , listen: false).AddCountNotification(1);
    Provider.of<WalletProvider>(context , listen: false).Discountwallet(total);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DoneBooking(),),(route) => false,);

  }
}