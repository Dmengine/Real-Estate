import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/Constant/Text.dart';
import 'package:real_estate/Constant/asset_name.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/extra.dart' as android_extra;
import 'package:intent/typedExtra.dart' as android_typedExtra;
import 'package:intent/action.dart' as android_action;
import 'package:real_estate/Notifier/HouseTypeAndAddressNotifier.dart';
class ThreeD extends StatefulWidget {
  @override
  _ThreeDState createState() => _ThreeDState();
}

class _ThreeDState extends State<ThreeD> {

  @override
  Widget build(BuildContext context) {

    double HEIGTH = MediaQuery.of(context).size.height;
    double WIDTH = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4,),
              Container(
                height: HEIGTH*0.1,
                width: WIDTH*0.2,
                child: Image.asset(threed,fit: BoxFit.contain,),
              ),
              Container(
                width: WIDTH*0.8,
                child: Center(
                  child: AutoSizeText(
                    capture_3d,
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Divider(thickness: 2,),
              SizedBox(height: 5,),
              Container(
                child: Center(
                  child: AutoSizeText(
                    "Small room",
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),

              Container(
                child: Image.asset(small_room,fit: BoxFit.contain,),
              ),
              SizedBox(height: 10,),
              Container(
                width: WIDTH*0.8,
                child: Center(
                  child: AutoSizeText(
                    small_room_description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.black38,
                      fontSize: 14
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6,),
              Container(
                child: FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "Start listing",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: ()async{
                    Provider.of<HouseTypeNotifier>(context,listen: false).setHouseType("small");
                    Navigator.pushNamed(context, "/addaddress");
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: WIDTH*0.6,
                child: Center(
                  child: AutoSizeText(
                    "Medium room",
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Image.asset(medium_room,fit: BoxFit.contain,),
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: AutoSizeText(
                    medium_room_description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6,),
              Container(
                child: FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "Start listing",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: (){

                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: AutoSizeText(
                    "Large room",
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),

              Container(
                child: Image.asset(large_room,fit: BoxFit.contain,),
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: AutoSizeText(
                    large_room_description,
                    textAlign: TextAlign.center,

                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6,),
              Container(
                child: FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "Start listing",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: (){

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
