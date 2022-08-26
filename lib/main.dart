import 'package:flutter/material.dart';
import 'package:wallet/Constant/Color.dart';
import 'package:wallet/Home.dart';
import 'package:wallet/welcome.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: background,
            child: Welcome(),
            // child: Home(),
          ),
        ),
      ),
    );
  }
}
