import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/Notifier/HouseTypeAndAddressNotifier.dart';
import 'package:real_estate/Notifier/ParanomalModelNotifier.dart';
import 'package:real_estate/Notifier/ThreeDImageIndexNotifier.dart';
import 'package:real_estate/Screens/Authentication/Register.dart';
import 'package:real_estate/Screens/Home/DashBoard/AddAddress.dart';
import 'package:real_estate/Screens/Home/DashBoard/AddHousePage.dart';
import 'package:real_estate/Screens/Home/DashBoard/CaptureTipsHome.dart';
import 'package:real_estate/Screens/Intro/IntroScreen.dart';
import 'package:real_estate/Screens/SplashScreen/SplashScreen.dart';
import 'package:real_estate/Screens/Wrapper/Wrapper.dart';
import 'package:real_estate/Widget/3DPreview.dart';

import 'Screens/Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider.value(
        value: ParanomalModelNotifier(),
        child: ChangeNotifierProvider.value(
          value: HouseTypeNotifier(),
          child: ChangeNotifierProvider.value(
            value: ThreeDImageIndexNotifier(),
            child: MultiProvider(
              providers: [
                StreamProvider.value(value: FirebaseAuth.instance.authStateChanges()),
              ],
                child: MyApp()
            ),
          ),
        ),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:"/splashscreen",
      routes: {
        "/splashscreen":(context)=>SplashScreen(),
        "/intro":(context)=>IntroScreen(),
        "/wrapper":(context)=>Wrapper(),
        "/register":(context)=>Register(),
        "/addaddress":(context)=>AddAddress(),
        "/capturetips":(context)=>CaptureTipsHome(),
        "/addhousepage":(context)=>AddPage(),
        "/home":(context)=>Home(),
      },
    );
  }
}

