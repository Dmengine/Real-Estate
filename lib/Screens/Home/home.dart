import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/Constant/Color_constant.dart';
import 'package:real_estate/FireBase/AuthService.dart';
import 'package:real_estate/Screens/Home/DashBoard/Listing.dart';
import 'package:real_estate/Screens/Home/DashBoard/Profile.dart';
import 'package:real_estate/Screens/Home/DashBoard/ThreeD.dart';
class Home extends StatefulWidget {

  Function toggleview;

  Home({this.toggleview});

  @override
  _HomeState createState() => _HomeState();
}
PageController pageController = PageController(initialPage: 0, keepPage: true);
int _index = 0;

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));
  }
  @override
  Widget build(BuildContext context) {
    double HEIGTH = MediaQuery.of(context).size.height;
    double WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.location_on_outlined,
          color: Colors.red,
        ),
        title: Text(
          "Manchester UK",
          style: GoogleFonts.lato(
            fontSize: 18,
            color: Colors.black38
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.add_alert_rounded,
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: ()async{
             await AuthService().logOut();
             Navigator.pushNamedAndRemoveUntil(context, "/wrapper", (route) => false);
            },
            child:Text(
              "Log out",
              style: TextStyle(
                color: Colors.black
              ),
            )
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            _index=index;
          });
        },
        children: [
          Listing(),
          ThreeD(),
          Profile()
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        color: Colors.white,
        height: 60.0,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white12,
        animationCurve: Curves.easeIn,
        items: [
          Icon(Icons.home,color: Colors.blue,),
          Icon(Icons.add_box,color: Colors.blue,),
          Icon(Icons.people,color: Colors.blue,)
        ],
        onTap: (index){
          setState(() {
            _index=index;
            pageController.jumpToPage(_index);
          });
        },
      )
    );
  }
}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.7020000);
    path_0.quadraticBezierTo(0,size.height*0.8505000,0,size.height*0.9000000);
    path_0.quadraticBezierTo(size.width*-0.0006250,size.height*0.9965000,size.width*0.0625000,size.height*0.9980000);
    path_0.lineTo(size.width*0.9387500,size.height);
    path_0.quadraticBezierTo(size.width*0.9996875,size.height*1.0010000,size.width,size.height*0.9000000);
    path_0.quadraticBezierTo(size.width,size.height*0.8500000,size.width,size.height*0.7000000);
    path_0.quadraticBezierTo(size.width*0.9959375,size.height*0.6010000,size.width*0.9362500,size.height*0.6000000);
    path_0.cubicTo(size.width*0.7171875,size.height*0.6005000,size.width*0.2793750,size.height*0.6025000,size.width*0.0600000,size.height*0.6020000);
    path_0.quadraticBezierTo(size.width*-0.0025000,size.height*0.6030000,0,size.height*0.7020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

