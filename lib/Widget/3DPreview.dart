import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/Notifier/ThreeDImageIndexNotifier.dart';

class ThreeDPreview extends StatelessWidget {
  List<dynamic> floors;
  ThreeDPreview({this.floors});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThreeDImageIndexNotifier>(
      builder: (context,selectedindex,widget)=> Scaffold(
          body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:CachedNetworkImage(
            imageUrl: floors[selectedindex.index]['url'],
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) =>
                Panorama(
                  child: Image(
                    image: imageProvider,
                  ),
                ),
            placeholder: (context, url) =>
                Container(width: MediaQuery
                    .of(context)
                    .size
                    .width,
                    child: Center(
                        child: CircularProgressIndicator())),
            errorWidget: (context, url, error) =>
                Container(width: MediaQuery
                    .of(context)
                    .size
                    .width,
                    child: Center(
                        child: Icon(Icons.error))),
          ),
        ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: floors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Provider.of<ThreeDImageIndexNotifier>(context,listen: false).changeIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width*0.4,
                          height:  MediaQuery.of(context).size.height*0.3,
                          child: Column(
                            children: [
                              Expanded(flex:5,child:CachedNetworkImage(
                                imageUrl: floors[index]['url'],
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) => Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                                placeholder: (context, url) =>
                                    Container(width:MediaQuery.of(context).size.width,child: Center(child: CircularProgressIndicator())),
                                errorWidget: (context, url, error) =>
                                    Container(width:MediaQuery.of(context).size.width,child: Center(child: Icon(Icons.error))),
                              ),
                              ),
                              SizedBox(height: 5,),
                              Expanded(flex:1,child: Container(color:Colors.white,width:MediaQuery.of(context).size.width*0.4,child: AutoSizeText(floors[index]['floors'],textAlign: TextAlign.center,style: TextStyle(backgroundColor: Colors.white,fontWeight: FontWeight.bold),))),
                            ],
                          ),
                        ),

                      );
                    }
                )
              ),
            )
      ]
          )
      ),
    );
  }
}
