import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/FireBase/FirebaseCollection.dart';
import 'package:real_estate/Models/ListingModel.dart';
import 'package:real_estate/Widget/3DPreview.dart';
import 'package:shimmer/shimmer.dart';

class Listing extends StatefulWidget {

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseCollection().Listing,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ListingModel> lists = snapshot.data.docs.map((e) {
              return ListingModel(
                  housetype: e['house_type'],
                  owner: e['owner'],
                  floors: e['floor'],
                  firstpicurl: e["firstpicurl"]);
            }).toList();
            print(lists.length);
            return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: lists.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                                  lists[index].housetype,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 25),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.4,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThreeDPreview(
                                                    floors: lists[index]
                                                        .floors)));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: lists[index].firstpicurl,
                                    fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) =>
                                        Image(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
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
                                ))
                          ],
                        );
                      },
                    )));
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey[100],
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 70,
                              width: 100,
                              color: Colors.black,
                              margin: EdgeInsets.all(10),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                                height: 40,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                color: Colors.black,
                                margin: EdgeInsets.all(10)))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 70,
                              width: 100,
                              color: Colors.black,
                              margin: EdgeInsets.all(10),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                                height: 40,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                color: Colors.black,
                                margin: EdgeInsets.all(10)))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 70,
                              width: 100,
                              color: Colors.black,
                              margin: EdgeInsets.all(10),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                                height: 40,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                color: Colors.black,
                                margin: EdgeInsets.all(10)))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 70,
                              width: 100,
                              color: Colors.black,
                              margin: EdgeInsets.all(10),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                                height: 40,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                margin: EdgeInsets.all(10)))
                      ],
                    ),
                  ],
                ));
          }
        });
  }
}
