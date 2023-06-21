import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/create_account.dart';
import 'package:movie_ticket_app/forgot_password.dart';
import 'package:movie_ticket_app/homepage.dart';
import 'package:movie_ticket_app/homepage_book_tickets.dart';
import 'package:movie_ticket_app/homepage_movie_store.dart';
import 'package:movie_ticket_app/homepage_whathot_all.dart';
import 'package:movie_ticket_app/log_in.dart';
import 'package:movie_ticket_app/menu.dart';
import 'package:movie_ticket_app/menu_my_movie.dart';
import 'package:movie_ticket_app/menu_notification.dart';
import 'package:movie_ticket_app/menu_settings.dart';
import 'package:movie_ticket_app/menu_settings_version.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/splash_screen.dart';
import 'package:movie_ticket_app/widget_tree.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(My_App());
}

class My_App extends StatefulWidget {
  const My_App({super.key});

  @override
  State<My_App> createState() => _My_AppState();
}

class _My_AppState extends State<My_App> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRouter.createAccount:
            return MaterialPageRoute(
                builder: (context) => CreateAccount(),
                settings: RouteSettings(name: AppRouter.createAccount));

          case AppRouter.forgotPassword:
            return MaterialPageRoute(
                builder: (context) => ForgotPassword(),
                settings: RouteSettings(name: AppRouter.forgotPassword));

          case AppRouter.homepage:
            return MaterialPageRoute(
              settings: RouteSettings(name: AppRouter.homepage),
                builder: (context) => HomePage(),
                );

          case AppRouter.homepageMovieStore:
            return MaterialPageRoute(
                builder: (context) => HomepageMovieStore(),
                settings: RouteSettings(name: AppRouter.homepageMovieStore));

          case AppRouter.homepageWhathotAll:
            return MaterialPageRoute(
                builder: (context) => HomePageWhatHotAll(),
                settings: RouteSettings(name: AppRouter.homepageWhathotAll));

          case AppRouter.logIn:
            return MaterialPageRoute(
                builder: (context) => LogIn(),
                settings: RouteSettings(name: AppRouter.logIn, arguments: {}));

          case AppRouter.menu:
            return MaterialPageRoute(
                builder: (context) => MenuApp(),
                settings: RouteSettings(name: AppRouter.menu));

          case AppRouter.menuMyMovie:
            return MaterialPageRoute(
                builder: (context) => MenuMyMovie(),
                settings: RouteSettings(name: AppRouter.menuMyMovie));

          case AppRouter.menuNotification:
            return MaterialPageRoute(
                builder: (context) => MenuNotification(),
                settings: RouteSettings(name: AppRouter.menuNotification));

          case AppRouter.menuSetting:
            return MaterialPageRoute(
                builder: (context) => MenuSetting(),
                settings: RouteSettings(name: AppRouter.menuSetting));

          case AppRouter.menuSettingVersion:
            return MaterialPageRoute(
                builder: (context) => MenuSettingVersion(),
                settings: RouteSettings(name: AppRouter.menuSettingVersion));

          case AppRouter.createAccount:
            return MaterialPageRoute(
                builder: (context) => CreateAccount(),
                settings: RouteSettings(name: AppRouter.menuTheater));

          case AppRouter.bookTickets:
            return MaterialPageRoute(
                builder: (context) => BookTickets(),
                settings: RouteSettings(name: AppRouter.bookTickets));

          default:
            return null;

          // case AppRouter.splashScreen:
          //   return MaterialPageRoute(
          //       builder: (context) => SplashScreen(),
          //       settings: RouteSettings(name: AppRouter.splashScreen));
        }
      },
      home: SplashScreen(),
    );
    // return MaterialApp(home: WidgetTree());
    // return MaterialApp(home: HomePage());
  }
}
