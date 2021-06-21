import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate/Models/UserModel.dart';
import 'package:flutter/material.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future createDocForNewUser(String email,String fullname,String uid,String password) async{
    CollectionReference profileRefCollection=FirebaseFirestore.instance.collection("profile");
    await profileRefCollection.doc(uid).set({
      'fullname': fullname,
      'email': email,
      'password':password
    });
  }

Future<UserModel> CreateAccount(String email,String password,String fullname,BuildContext context)async{
    UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user=userCredential.user;
    createDocForNewUser(email, fullname, user.uid,password);
    return UserModel(uid: user.uid);
}
  Future<UserModel> signInWithEmailAndPassword(String email,String password)async{
    UserCredential userCredential=await _auth.signInWithEmailAndPassword(email: email, password: password);
    User user=userCredential.user;
    return UserModel(uid: user.uid);
  }
  Future<void> logOut()async{
    await _auth.signOut();
  }
}