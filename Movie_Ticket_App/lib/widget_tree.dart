import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_ticket_app/authentication.dart';
import 'package:movie_ticket_app/homepage.dart';
import 'package:movie_ticket_app/log_in.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authenStateChanges,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LogIn();
        }
      },
    );
  }
}
