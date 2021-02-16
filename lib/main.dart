import 'package:covid_status/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() async {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScreen());
  }
}
