import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imobile_techs/LoginScreen.dart';
import 'package:imobile_techs/webview.dart';




class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => WebsitePage() ))
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Stack(

        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/imobiletechs-logo-icon.png",
                      fit: BoxFit.fill,
                      height: 100,
                    ),
                    Image.asset(
                      "assets/imobiletechs-logo-text.png",
                      fit: BoxFit.fill,
                      height: 60,
                    ),
                  ],
                ),
              ),

            ),
          ),

        ],
      ),
    );
  }
}