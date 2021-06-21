import 'package:flutter/cupertino.dart';

class ThreeDImageIndexNotifier extends ChangeNotifier{
  int index=0;
  changeIndex(int index){
    this.index=index;
    notifyListeners();
  }
}