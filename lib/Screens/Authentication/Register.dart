import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/Constant/Text_field_decoration.dart';
import 'package:real_estate/FireBase/AuthService.dart';
import 'package:real_estate/Notifier/UserNotifier.dart';
import 'package:steps/steps.dart';
class Register extends StatelessWidget {
  String _email;
  String _fullname;
  String _password;
  final _key=GlobalKey<FormState>();
  final TextEditingController emailEditingController=TextEditingController();
  final TextEditingController namecontroller=TextEditingController();
  final TextEditingController passwordEditingController=TextEditingController();
  final TextEditingController password2EditingController=TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double HEIGTH = MediaQuery.of(context).size.height;
    double WIDTH = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Lets know who you are",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: CustomPaint(
            size: Size(WIDTH*0.9,(HEIGTH*0.4).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter()
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CustomPaint(
                size: Size(WIDTH*1.5,(HEIGTH*0.45).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter3()
            ),
          ),
          Positioned(
            left: 50,
            bottom: 0,
            child: Opacity(
              opacity: 0.6,
              child: CustomPaint(
                  size: Size(WIDTH,(HEIGTH*0.4).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter2()
              ),
            ),
          ),
      Positioned(
        top: 0,
        child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            child: Steps(
              direction: Axis.vertical,
              path: {'color':Colors.blue,'width':3.0},
              steps: [
                {
                  'color':Colors.white,
                  'background':Colors.blue,
                  'label':'1',
                  'content': Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.lato(
                          color: HexColor("545652"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: emailEditingController,
                        // initialValue: _email,
                        decoration: inputDecoration.copyWith(hintText: "Email",icon: Icon(Icons.email_outlined,size: 24,)),
                        validator: (val)=>!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val)
                ? "please enter valid email"
                    : null,
                      )
                    ],
                  )
                },
                {
                  'color':Colors.white,
                  'background':Colors.blue,
                  'label':'2',
                  'content': Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full name",
                        style: GoogleFonts.lato(
                          color: HexColor("545652"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: namecontroller,
                        decoration: inputDecoration.copyWith(hintText: "Lastname    Firstname",icon: Icon(Icons.people,size: 24,)),
                        validator: (val)=>!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(val)?"Please enter a valid name":null,
                      )
                    ],
                  )
                },
                {
                  'color':Colors.white,
                  'background':Colors.blue,
                  'label':'3',
                  'content': Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose a password",
                        style: GoogleFonts.lato(
                          color: HexColor("545652"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.8,
                              child: Text(
                                "password must be greater than 6",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  color: HexColor("545652"),
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        obscureText: true,
                        controller: passwordEditingController,
                        decoration: inputDecoration.copyWith(hintText: "password",icon: Icon(Icons.lock,size: 24,)),
                        validator: (val)=>val.length<6?"invalid password":null,
                      ),
                      SizedBox(height: 5,),

                      Text(
                        "Confirm password",
                        style: GoogleFonts.lato(
                          color: HexColor("545652"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        obscureText: true,
                        controller: password2EditingController,
                        decoration: inputDecoration.copyWith(hintText: "Confirm password",icon: Icon(Icons.lock,size: 24,)),
                        validator: (val)=>val==passwordEditingController.text.toString()?null:"Password does not match",
                      )
                    ],
                  )
                },
              ],
              ),
          ),
        ),
        ),
      ),
          Positioned(
            bottom: MediaQuery.of(context).size.height*0.2,
            left: MediaQuery.of(context).size.height*0.18,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(
                      color: Colors.blue
                  )
              ),
              color: Colors.blue,
              child: Text(
                "Register",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              onPressed: () async{
                if(_key.currentState.validate()){
                  _email=emailEditingController.text.trim();
                  _fullname=namecontroller.text.trim();
                  _password=passwordEditingController.text.trim();
                  print(_email);
                  print(_fullname);
                  print(_password);
                  try{
                    final user=await AuthService().CreateAccount(_email, _password, _fullname,context);
                    print(user.uid);
                    if(user!=null){
                     // Provider.of<UserNotifier>(context).addUser(user.uid);
                      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                    }
                  }catch(e){

                    var error=e.toString().split("]");
                    String serve=error[1];
                    print(serve);
                    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(serve),backgroundColor: Colors.red,));
                  }

                }
              },
            ),
          ),
  ]
    ),
    );
  }
}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.7000000);
    path_0.lineTo(size.width*0.3787500,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,size.height*0.7000000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.lightBlue[200]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(size.width*0.5000000,size.height*0.7980000);
    path_0.lineTo(size.width*0.4375000,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainter3 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width,size.height*0.8020000);
    path_0.lineTo(size.width*0.5637500,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width,size.height*0.8020000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

