import 'package:flutter/cupertino.dart';
class WalletProvider extends ChangeNotifier{
  double? mony ;
  ChargeWallet(double Mon){
    mony = Mon;
    notifyListeners();
  }
  Discountwallet(double Mon){
    mony = mony! - Mon;
    notifyListeners();
  }
}