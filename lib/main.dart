
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          canvasColor: Colors.black,
          textTheme: TextTheme(
           headline1:TextStyle(
             fontSize: 30,
             fontWeight: FontWeight.bold,
             color: Colors.black,
           ),
              headline2:TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
          )),
      home: MyHomePage(),
    );
  }
}
