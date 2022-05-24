import 'package:flutter/material.dart';
import 'package:poll_app/Pages/Main_screen.dart';
import 'package:poll_app/Pages/Auth.dart';

void main() async {

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/auth': (context) => Authorization(),
      //'/home': (context) => HomePage(),
    },
  ));
}


