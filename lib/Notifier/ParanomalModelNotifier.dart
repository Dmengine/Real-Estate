import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:real_estate/Models/ParanomalModel.dart';

class ParanomalModelNotifier extends ChangeNotifier{
  List <ParanomalModel> paranomalLists=[];

  addParanomal(ParanomalModel paranomalModel){
    paranomalLists.add(paranomalModel);
    notifyListeners();
  }
}