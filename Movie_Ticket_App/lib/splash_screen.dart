import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  void delay() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
    //todo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/image/image_splash.png",
            height: 490,
            width: 420,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Welcome To Movie",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
                color: Colors.red,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 80),
          SpinKitFadingCircle(
            color: Colors.red,
            size: 80,
          )
        ],
      ),
    );
  }
}
