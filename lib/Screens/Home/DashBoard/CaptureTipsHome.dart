import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:real_estate/Constant/Text.dart';
import 'package:real_estate/Constant/asset_name.dart';
import 'package:real_estate/Constant/svg_constant.dart';

class CaptureTipsHome extends StatefulWidget {
  @override
  _CaptureTipsHome createState() => _CaptureTipsHome();
}

class _CaptureTipsHome extends State<CaptureTipsHome> {
  @override
  void initState() {
    // TODO: implement initState
  }


  @override
  Widget build(BuildContext context) {
    double HEIGTH = MediaQuery.of(context).size.height;
    double WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black38,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:MediaQuery.of(context).size.height*0.15,),
                Container(
                  child: AutoSizeText(
                    post_a_rental,
                    style: GoogleFonts.lato(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: AutoSizeText(
                    post_a_rental_description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: WIDTH,
                  height: HEIGTH*0.2,
                  child: SvgPicture.asset(
                    house_for_sale
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blue
                      )
                    ),
                    onPressed: (){
                      showMyBottomSheet();
                    },
                    child: Icon(
                      Icons.panorama_horizontal_outlined,
                      color: Colors.blue,
                      size: 30,
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


   showMyBottomSheet(){
       showMaterialModalBottomSheet(
       context: context,
       isDismissible: true,
       backgroundColor: Colors.white70,
       bounce: true,
       builder: (context) => Container(
         padding: EdgeInsets.all(10),
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               AutoSizeText(
                 "We recomended using a third party application (360 panorama) and let the app handle the rest",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 15,
                   fontWeight: FontWeight.bold
                 ),
               ),
               Container(
                 width: MediaQuery.of(context).size.width*0.9,
                 height: MediaQuery.of(context).size.height*0.3,
                 child: Image.asset(panorama,fit: BoxFit.contain,),
               ),
               SizedBox(height: 15,),
               Container(
                 width: MediaQuery.of(context).size.width*0.5,
                 child: FlatButton(
                   color: Colors.blue,
                   shape: RoundedRectangleBorder(
                       side: BorderSide(
                           color: Colors.blue
                       )
                   ),
                   onPressed: (){
                     Navigator.pop(context);
                     Navigator.pushNamed(context, "/addhousepage");
                   },
                   child: Text(
                     "Continue",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                     ),
                   )
                 ),
               )
             ],
           ),
         ) ,
       ),
     );
  }
}


