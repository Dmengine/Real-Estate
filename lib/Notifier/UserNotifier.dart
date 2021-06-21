import 'package:flutter/cupertino.dart';
import 'package:real_estate/Models/UserModel.dart';

class UserNotifier extends ChangeNotifier{
  UserModel userModel;

    addUser(String uid){
    userModel=new UserModel(uid: uid);
    notifyListeners();
  }
}