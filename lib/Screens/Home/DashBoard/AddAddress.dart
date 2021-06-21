import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:real_estate/Constant/Color_constant.dart';
import 'package:device_apps/device_apps.dart';
import 'package:real_estate/Constant/svg_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent/android_intent.dart';

class AddAddress extends StatefulWidget {

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double HEIGTH = MediaQuery.of(context).size.height;
    double WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: HEIGTH*0.2,),
            AutoSizeText(
              "It's easier than ever to be a landlord",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28
              ),
            ),
                SizedBox(height: 10,),
            AutoSizeText(
              "Save time with our property management tools that help you get what you need — signed leases and rent payments.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18
              ),
            ),
                Container(
                  width: WIDTH,
                  height: HEIGTH*0.2,
                  child: SvgPicture.asset(
                    address,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: WIDTH*0.6,
                  height: HEIGTH*0.1,
                  child: FlatButton(
                      onPressed: ()async{
                        Navigator.pushNamed(context, "/capturetips");
                      },
                      child: Text(
                        "Choose",
                        style: TextStyle(
                        color: Colors.black38,
                      ),
                      ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black38
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
