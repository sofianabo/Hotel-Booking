import 'package:flutter/cupertino.dart';
class MyOffersProvider extends ChangeNotifier{
  List<Map<String, dynamic>> Offers = [
  ];
  SetData(newPrice,startOfferDate, endOfferDate, type, price, roomNumber, discount){
    Offers.add(
      {
        "newPrice": price - (price * (discount/100)) ,
        "startDate": startOfferDate.replaceAll("00:00:00.000", ""),
        "endDate": endOfferDate.replaceAll("00:00:00.000", ""),
        "type": type ,
        "price": price ,
        "roomNumber": roomNumber ,
        "discount": discount ,
      },
    );
    notifyListeners();
  }
  deleteoffr(index){
    Offers.removeAt(index);
    notifyListeners();
  }
}