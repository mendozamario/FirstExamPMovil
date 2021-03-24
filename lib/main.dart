import 'package:flutter/material.dart';
import 'package:parcial_1/screens/Login_screen.dart';
import 'package:parcial_1/screens/edit_screen.dart';
import 'package:parcial_1/screens/home_screen.dart';
 

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Exam one'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }

}
