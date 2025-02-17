import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle boldTextFieldStyle(){
    return const TextStyle(
        color:Colors.black,
        fontSize:30.0,
        fontWeight: FontWeight.w500,
    );
  }
  static TextStyle lightTextFieldStyle(){
    return const TextStyle(
        color:Colors.black54,
        fontSize:20.0,
        fontWeight: FontWeight.w400,
    );
  }
  static TextStyle semiboldTextFieldStyle(){
    return const TextStyle(
             color:Colors.black,
             fontSize:20.0,
             fontWeight:FontWeight.bold
             );
  }
  }