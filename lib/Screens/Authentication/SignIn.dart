import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/Constant/asset_name.dart';
import 'package:real_estate/FireBase/AuthService.dart';
import 'package:real_estate/Models/UserModel.dart';

class SignIn extends StatefulWidget{

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  String _email;
  String _password;
  final _key = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    double HEIGTH = MediaQuery.of(context).size.height;
    double WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
        Positioned(
          bottom: 0,
          child: CustomPaint(
            size: Size(WIDTH, (HEIGTH * 0.55).toDouble()),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
        Positioned(
          left: 20,
          top: HEIGTH*0.1,
            child: Text(
              "Sign in",
              style: GoogleFonts.lato(
                color: Colors.black54,
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),
            )
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              width: WIDTH,
              height: MediaQuery.of(context).size.height*0.75,
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.blue),
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue,
                            size: 18,
                          ),
                          hintText: "Email",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.blue,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      validator: (val) =>
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? "please enter valid email"
                              : null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.green),
                        icon: Icon(
                          Icons.lock,
                          size: 18,
                          color: Colors.blue,
                        ),
                        hintText: "password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.blue,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? "please provide a valid password"
                          : null,
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: WIDTH,
                      height: HEIGTH*0.07,
                      child: FlatButton(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        hoverColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.blue,
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            _email=emailcontroller.text.trim();
                            _password=passwordcontroller.text.trim();
                            try{
                              UserModel usermodel=await AuthService().signInWithEmailAndPassword(_email, _password);
                              print(usermodel.uid);
                              if(usermodel.uid!=null){
                                Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                              }
                            }catch(e){
                              var error=e.toString().split("]");
                              String serve=error[1];
                              _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(serve),backgroundColor: Colors.red,));

                            }
                          }

                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      "or",
                      style: TextStyle(
                        color: Colors.black54
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Image.asset(google_sign_in, fit: BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: HEIGTH*0.2,
            left: WIDTH*0.35,
            child:  Text(
              "Not a member",
              style: TextStyle(
                  color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
        ),
            Positioned(
              bottom: HEIGTH*0.1,
              left: WIDTH*0.35,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "/register");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: Colors.white)),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3020000);
    path_0.lineTo(size.width * 0.3737500, size.height * 0.5020000);
    path_0.quadraticBezierTo(size.width * 0.4512500, size.height * 0.5345000,
        size.width * 0.4987500, size.height * 0.5000000);
    path_0.quadraticBezierTo(size.width * 0.5928125, size.height * 0.4005000,
        size.width * 0.8737500, size.height * 0.1240000);
    path_0.quadraticBezierTo(size.width * 0.9087500, size.height * 0.0925000,
        size.width * 0.9237500, size.height * 0.0920000);
    path_0.quadraticBezierTo(size.width * 0.9543750, size.height * 0.0835000,
        size.width, size.height * 0.1100000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.3020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
