import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/Constant/Color_constant.dart';
import 'package:real_estate/Screens/Wrapper/Wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.blue));
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, "/intro");
    });
  }

  @override
  Widget build(BuildContext context) {
    double HEIGTH = MediaQuery
        .of(context)
        .size
        .height;
    double WIDTH = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        backgroundColor: Colors.blue[800],
        body: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: HEIGTH * 0.1,
              child: Opacity(
                opacity: 0.5,
                child: CustomPaint(
                  size: Size(WIDTH * 0.9, (HEIGTH * 0.3).toDouble()),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0.3,
                child: CustomPaint(
                  size: Size(WIDTH * 0.8, (HEIGTH * 0.5).toDouble()),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter2(),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Opacity(
                opacity: 0.3,
                child: CustomPaint(
                  size: Size(WIDTH, (HEIGTH * 0.3).toDouble()),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter3(),
                ),
              ),
            ),
            Positioned(
                left: WIDTH * 0.35,
                top: HEIGTH * 0.5,
                child: Center(
                  child: Text(
                    "JHELLY",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40
                    ),
                  ),
                )
            ),
              Positioned(
                top: HEIGTH*0.1,
                child: Opacity(
                  opacity: 0.4,
                  child: CustomPaint(
                  size: Size(WIDTH,(HEIGTH*0.4).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
            ),
                ),
              ),
             Positioned(
               bottom: HEIGTH*0.05,
               left: WIDTH*0.3,
               child: Opacity(
                 opacity: 0.3,
                 child: CustomPaint(
                  size: Size(WIDTH,(HEIGTH*0.3).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: CirclePaint(),
            ),
               ),
             ),
            Positioned(
              top: HEIGTH*0.2,
              left: 0.5,
              child: Opacity(
                opacity: 0.3,
                child: CustomPaint(
                  size: Size(WIDTH,(HEIGTH*0.3).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: CirclePaint2(),
                ),
              ),
            ),
          ],
        )
    );
  }
}

class RPSCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.blue[700]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.4020000);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.6000000);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.4020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RPSCustomPainter2 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2512500, size.height * 0.8020000);
    path_0.lineTo(size.width * 0.5387500, size.height * 0.4020000);
    path_0.lineTo(size.width * 0.5625000, size.height * 0.9020000);
    path_0.lineTo(size.width * 0.2512500, size.height * 0.8020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RPSCustomPainter3 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.0040000);
    path_0.lineTo(size.width * 0.4987500, size.height * 0.4040000);
    path_0.lineTo(size.width, size.height * 0.7080000);
    path_0.lineTo(size.width, size.height * 0.0040000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainter4 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width,size.height*0.1980000);
    path_0.lineTo(size.width*0.8125000,size.height*0.5020000);
    path_0.lineTo(size.width,size.height*0.5000000);
    path_0.lineTo(size.width,size.height*0.1980000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class CirclePaint2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.4350000,size.height*0.5020000);
    path_0.quadraticBezierTo(size.width*0.3762500,size.height*0.5070000,size.width*0.3750000,size.height*0.6020000);
    path_0.quadraticBezierTo(size.width*0.3740625,size.height*0.6930000,size.width*0.4362500,size.height*0.7020000);
    path_0.quadraticBezierTo(size.width*0.4978125,size.height*0.6970000,size.width*0.5000000,size.height*0.6020000);
    path_0.quadraticBezierTo(size.width*0.5000000,size.height*0.5090000,size.width*0.4350000,size.height*0.5020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class CirclePaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4350000, size.height * 0.5020000);
    path_0.quadraticBezierTo(
        size.width * 0.3762500, size.height * 0.5070000, size.width * 0.3750000,
        size.height * 0.6020000);
    path_0.quadraticBezierTo(
        size.width * 0.3740625, size.height * 0.6930000, size.width * 0.4362500,
        size.height * 0.7020000);
    path_0.quadraticBezierTo(
        size.width * 0.4978125, size.height * 0.6970000, size.width * 0.5000000,
        size.height * 0.6020000);
    path_0.quadraticBezierTo(
        size.width * 0.5000000, size.height * 0.5090000, size.width * 0.4350000,
        size.height * 0.5020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

