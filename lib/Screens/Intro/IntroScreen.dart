import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/Constant/Color_constant.dart';
import 'package:real_estate/Constant/svg_constant.dart';
import 'package:real_estate/Models/IntroScreenModel.dart';

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.blue));
    List<IntroScreenModel> pageData=[
      IntroScreenModel(assetname:buy_a_home,text:"Buy a home",description: "Find your place with an immersive photo experience and the most listings, include things you won't find anywhere else",button: null,textcolor: Colors.white ),
      IntroScreenModel(assetname:house_for_sale,text:"Sell a home",description: "Whether you get a cash offer through JHELLY , we can help you navigate a successful sale",button: null,textcolor: Colors.black87 ),
      IntroScreenModel(assetname:apartment_rent,text:"Rent a home",description: "We're creating a seamless online experience-from shopping on the largest rental network, to applying, to paying rent ",button: RaisedButton(
        color:Colors.blue,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
                color: Colors.white
            )
        ),
        child: Text(
          "Get started",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25
          ),
        ),
        onPressed: (){
          Navigator.pushNamedAndRemoveUntil(context, "/wrapper", (route) => false);
        },
      ),
          textcolor: Colors.white
      ),

    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ConcentricPageView(
          pageController: PageController(initialPage: 0),
          opacityFactor: 1.0,
          direction: Axis.vertical,
          colors: pageview_color,
          curve: Curves.bounceInOut,
          itemCount: pageData.length,
          duration: Duration(seconds: 1),
          radius: 10,
          itemBuilder: (index,value){
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      pageData[index].assetname,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    pageData[index].text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: pageData[index].textcolor
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    pageData[index].description,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: pageData[index].textcolor
                    )
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                  pageData[index].button==null?Text("Swipe up",style: TextStyle(color: Colors.white),):pageData[index].button
                ],
              ),
            );
          },
        ),
        ),
    );
  }
}
