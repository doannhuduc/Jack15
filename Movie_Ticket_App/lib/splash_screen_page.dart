import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/user_infor_model.dart';
import 'package:movie_ticket_app/utils/config.dart';
import 'package:movie_ticket_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    delay();
    super.initState();
  }

  void delay() async {
    await Future.delayed(Duration(milliseconds: 1500));

    //check user logined
    final isLogined = (await StorageData.getData(key: 'email')).isNotEmpty;

    // if user don't logined
    if (!isLogined) {
      Navigator.pushNamed(context, AppRouter.homepage);
    }

    //if user logined
    else {
      final stringUser = await StorageData.getData(key: "user");
      final mapUser = jsonDecode(stringUser);
      Config.isGuestMode = false;
      Config.user = UserInfoModel.fromJson(mapUser);
      Navigator.pushNamed(context, AppRouter.homepage);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/image/image_splash.png",
                height: 490,
                width: 420,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: const [
              SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: Text(
                    "Welcome To Movie",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Colors.red,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(height: 50),
          const SpinKitFadingCircle(
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
