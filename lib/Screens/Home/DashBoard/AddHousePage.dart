import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panorama/panorama.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/FireBase/FirebaseStorage.dart';
import 'package:real_estate/Models/ListingModel.dart';
import 'package:real_estate/Models/ParanomalModel.dart';
import 'package:real_estate/Notifier/HouseTypeAndAddressNotifier.dart';
import 'package:real_estate/Notifier/ParanomalModelNotifier.dart';
import 'package:real_estate/Widget/LoadingScreen.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController floorController = TextEditingController();
  TextEditingController roomnameController = TextEditingController();
  final _key = GlobalKey<FormState>();

  File _image;
  final picker = ImagePicker();
  ParanomalModel paranomalmodel;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        paranomalmodel=new ParanomalModel();
        paranomalmodel.image=_image;
        print(_image.path);
      } else {
        print('No image selected.');
      }
    });
    setState(() {

    });
  }

  showError() {
    AwesomeDialog(
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.RIGHSLIDE,
      headerAnimationLoop: false,
      title: 'Error',
      desc: "An image is not selected",)
      ..show();
  }
  savePost()async{
   try{
     List<String> urls= await FireBaseStorage().uploadFiles(Provider.of<ParanomalModelNotifier>(context,listen: false).paranomalLists);
     // urls.map((e){
     //   print("mapping");
     //   floor.add({"floor":floorController.text.toString(),"url":e,"room":roomnameController.text.toString()});
     // });
     List<Map<String,String>>floorbody=[];
     for(int i=0;i<urls.length;i++){
       floorbody.add({
         "floors": Provider.of<ParanomalModelNotifier>(context, listen: false).paranomalLists[i].floor,
         "url":urls[i]
       });
     }
     ListingModel listingmodel=ListingModel();
     listingmodel.housetype= Provider.of<HouseTypeNotifier>(context, listen: false).housetype;
     listingmodel.floors=floorbody;
     listingmodel.owner=Provider.of<User>(context,listen: false).uid;
     Map<String, dynamic> toJson() => {
       "firstpicurl":urls[0],
       "owner":listingmodel.owner,
       "house_type": listingmodel.housetype,
       "floor":listingmodel.floors,
     };
     print(toJson());
     await FirebaseFirestore.instance.collection("listing").add(toJson());
     Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
   }catch(e){
     Navigator.pop(context);

   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black38,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Form(
                  key: _key,
                  child: Consumer<ParanomalModelNotifier>(
                      builder: (context, data, widget) {
                        print(data.paranomalLists.length);
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.paranomalLists.isNotEmpty ? Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.15,
                                    child: GridView.builder(
                                        itemCount: data.paranomalLists.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                      itemBuilder: (context,index)=> Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child:Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Hero(
                                                  tag: "tag"+index.toString(),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>NavigateToHero(context, "tag"+index.toString(), data.paranomalLists[index].image)));
                                                    },
                                                  child: Image.file(
                                                      data.paranomalLists[index].image,fit:BoxFit.cover)
                                                  )
                                              ),
                                              ),
                                              SizedBox(height: 5,),
                                              AutoSizeText("Room "+data.paranomalLists[index].roomname.toString()),
                                              SizedBox(height: 5,),
                                              AutoSizeText("Floor: "+data.paranomalLists[index].floor.toString())
                                            ],
                                          ),
                                        ),
                                      )
                                    ),
                                  ),
                                )
                              ):Container(
                                child: Text(
                                  "No 3d images"
                                ),
                              ),
                              SizedBox(height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.03),
                              Container(
                                child: AutoSizeText(
                                  "Provide the details of the app",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                controller: roomnameController,
                                decoration: InputDecoration(
                                    hintText: "Floor",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        )
                                    )
                                ),
                                validator: (val) =>
                                val.isEmpty
                                    ? "Enter valid floor"
                                    : null,
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: floorController,
                                decoration: InputDecoration(
                                    hintText: "Room name",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        )
                                    )
                                ),
                                validator: (val) =>
                                val.isEmpty
                                    ? "Enter valid room name"
                                    : null,
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: FlatButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.blue
                                        )
                                    ),
                                    onPressed: getImage,
                                    child: Text(
                                      "Select image",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  color: Colors.white,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.05,
                                  child: _image == null
                                      ? Text("No image seleted")
                                      : Text(_image.path)
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: FlatButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.blue
                                        )
                                    ),
                                    onPressed: () {
                                      _image = null;
                                      Provider.of<ParanomalModelNotifier>(context,listen: false).paranomalLists.clear();
                                      setState(() {

                                      });
                                    },
                                    child: Text(
                                      "Clear",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.5,
                                child: FlatButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.blue
                                        )
                                    ),
                                    onPressed: () async{
                                      if (_key.currentState.validate()) {
                                        if (_image != null){
                                          paranomalmodel.roomname=roomnameController.text.toString();
                                          paranomalmodel.floor=floorController.text.toString();
                                          Provider.of<ParanomalModelNotifier>(
                                              context, listen: false)
                                              .addParanomal(paranomalmodel);
                                          roomnameController.clear();
                                          floorController.clear();
                                          setState(() {
                                            _image=null;
                                          });
                                        } else {
                                          showError();
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                ),
                              ), SizedBox(height: 10,),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.5,
                                child: FlatButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.blue
                                        )
                                    ),
                                    onPressed: ()async{
                                      if(Provider.of<ParanomalModelNotifier>(context,listen: false).paranomalLists.isNotEmpty){
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context)=>LoadingScreen(savePost: savePost(),
                                            )));
                                      }

                                        },
                                    child: Text(
                                      "Finish",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  )
              )
          ),
        ),
      ),
    );
  }
  Widget NavigateToHero(BuildContext context,String tag,File image) {
    return new Scaffold(
      body: Hero(
          tag: tag,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height*0.8,
            child:  Panorama(
              child: Image.file(image),
            ),
          )
      )
    );
  }
}
