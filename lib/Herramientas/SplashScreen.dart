import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Herramientas/Dashboard.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 3000),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: BounceInRight(
            child: Hero(
              tag: "logo",
              child: Image.asset(
                "images/logo.png",
                height: 50.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
