import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/FireBase/AuthService.dart';
import 'package:real_estate/Models/UserModel.dart';
import 'package:real_estate/Notifier/UserNotifier.dart';
import 'package:real_estate/Screens/Authentication/SignIn.dart';
import 'package:real_estate/Screens/Home/home.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
    toggleView() async{
      print("Signing out");
      await AuthService().logOut();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
      User user=Provider.of<User>(context);
    if(user==null){
      return SignIn();
    }else{
      return Home(toggleview:toggleView);
    }

  }
}
