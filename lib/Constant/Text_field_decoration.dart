import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

InputDecoration inputDecoration=InputDecoration(
  errorStyle: TextStyle(
      color: Colors.red
  ),
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
      borderRadius: BorderRadius.all(Radius.circular(20))
  ),
);