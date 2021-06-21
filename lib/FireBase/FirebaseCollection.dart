import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate/Models/ListingModel.dart';

class FirebaseCollection{


  Stream<QuerySnapshot> get Listing{
    return FirebaseFirestore.instance.collection("listing").snapshots();
}
}