import 'package:flutter/cupertino.dart';

class HouseTypeNotifier extends ChangeNotifier{
String housetype;
 setHouseType(String house){
   this.housetype=house;
   notifyListeners();
 }
}