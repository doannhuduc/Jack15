import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/api/firebase_api.dart';
import 'package:movie_ticket_app/banner/banner_model.dart';
import 'package:movie_ticket_app/banner/web_view_banner_page.dart';
import 'package:movie_ticket_app/forgot_password_page/forgot_password_page.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/choice_model.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/webview_choice_4dx.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/webview_choice_cgv_store.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/webview_choice_entertaiment.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/webview_choice_hall_rental.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/webview_choice_imax.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/webview_choice_sweetbox.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/cinema_model.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/list_cinema_by_date_page.dart';
import 'package:movie_ticket_app/menu_my_tickets/my_ticket_page.dart';
import 'package:movie_ticket_app/menu_theaters_page.dart';
import 'package:movie_ticket_app/movie_detail_page/movie_detail_page.dart';
import 'package:movie_ticket_app/detail_cinema_page/detail_cinema_page.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/movie_detail_page/youtube_player_page.dart';
import 'package:movie_ticket_app/movie_store_page.dart';
import 'package:movie_ticket_app/payment_page/completly_payment.dart';
import 'package:movie_ticket_app/payment_page/payment_page.dart';
import 'package:movie_ticket_app/promotion/promotion_model.dart';
import 'package:movie_ticket_app/promotion/promotion_page.dart';
import 'package:movie_ticket_app/promotion/web_view_page.dart';
import 'package:movie_ticket_app/register_page/create_account_page.dart';
import 'package:movie_ticket_app/homepage.dart';
import 'package:movie_ticket_app/log_in_page/log_in_page.dart';
import 'package:movie_ticket_app/menu_page.dart';
import 'package:movie_ticket_app/menu_my_movie_page.dart';
import 'package:movie_ticket_app/menu_notification_page.dart';
import 'package:movie_ticket_app/menu_settings_page.dart';
import 'package:movie_ticket_app/menu_settings_version_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/splash_screen_page.dart';
import 'package:movie_ticket_app/videos_homepage/videos_model.dart';
import 'package:movie_ticket_app/videos_homepage/videos_page.dart';
import 'package:movie_ticket_app/videos_homepage/youtube_player_homepage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  runApp(const My_App());
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

          case AppRouter.webViewBannerPage:
            return MaterialPageRoute(
                builder: (context) => WebViewBannerPage(
                      itemHere: settings.arguments as BannerModel,
                    ),
                settings: RouteSettings(name: AppRouter.webViewBannerPage));

          case AppRouter.homepageMovieStore:
            return MaterialPageRoute(
                builder: (context) => HomepageMovieStore(),
                settings: RouteSettings(name: AppRouter.homepageMovieStore));

          case AppRouter.promotionPage:
            return MaterialPageRoute(
                builder: (context) => PromotionPage(),
                settings: RouteSettings(name: AppRouter.promotionPage));

          case AppRouter.webViewPage:
            return MaterialPageRoute(
                builder: (context) => WebViewPage(
                      itemSecond: settings.arguments as PromotionModel,
                    ),
                settings: RouteSettings(name: AppRouter.webViewPage));

          case AppRouter.videosPage:
            return MaterialPageRoute(
                builder: (context) => VideosPage(),
                settings: RouteSettings(name: AppRouter.videosPage));

          case AppRouter.youtubeHomePage:
            return MaterialPageRoute(
                builder: (context) =>
                    YoutubeHomePage(url: settings.arguments as String),
                settings: RouteSettings(name: AppRouter.youtubeHomePage));

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

          case AppRouter.menuTheater:
            return MaterialPageRoute(
                builder: (context) => MenuTheater(),
                settings: RouteSettings(name: AppRouter.menuTheater));

          case AppRouter.movieDetailPage:
            return MaterialPageRoute(
                builder: (context) => MovieDetailPage(
                      itemMovie: settings.arguments as MovieModel,
                    ),
                settings: RouteSettings(name: AppRouter.movieDetailPage));

          case AppRouter.youtubePlayerPage:
            return MaterialPageRoute(
                builder: (context) => YoutubePlayerPage(
                      url: settings.arguments as String,
                    ),
                settings: RouteSettings(name: AppRouter.youtubePlayerPage));

          case AppRouter.listCinemaByDatePage:
            return MaterialPageRoute(
                builder: (context) => CinemaListByDatePage(
                      movieModel: settings.arguments as MovieModel,
                    ),
                settings: RouteSettings(name: AppRouter.listCinemaByDatePage));

          case AppRouter.detailCinemaPage:
            return MaterialPageRoute(
                builder: (context) => DetailCinemaPage(
                      itemCinema: (settings.arguments
                          as Map<String, dynamic>)["itemCinema"] as CinemaModel,
                      itemMovie: (settings.arguments
                          as Map<String, dynamic>)["itemMovie"] as MovieModel,
                    ),
                settings: RouteSettings(name: AppRouter.detailCinemaPage));

          case AppRouter.paymentPage:
            return MaterialPageRoute(
                builder: (context) => PaymentPage(
                      itemMovie: (settings.arguments
                          as Map<String, dynamic>)["itemMovie"] as MovieModel,
                      itemCinema: (settings.arguments
                          as Map<String, dynamic>)["itemCinema"] as CinemaModel,
                      money: (settings.arguments
                          as Map<String, dynamic>)["money"] as String,
                      quantity: (settings.arguments
                          as Map<String, dynamic>)["quantity"] as String,
                      nameItem: (settings.arguments
                              as Map<String, dynamic>)["seatsSelect"]
                          as List<String>,
                    ),
                settings: RouteSettings(name: AppRouter.paymentPage));

          case AppRouter.completlyPayment:
            return MaterialPageRoute(
                builder: (context) => CompletlyPayment(
                      item: (settings.arguments as Map<String, dynamic>)["item"]
                          as CinemaModel,
                      amountOfMoney: (settings.arguments
                          as Map<String, dynamic>)["money"] as String,
                      seats: (settings.arguments
                          as Map<String, dynamic>)["seats"] as List<String>,
                    ),
                settings: RouteSettings(name: AppRouter.completlyPayment));

          case AppRouter.menuMyTicket:
            return MaterialPageRoute(
                builder: (context) => MyTicket(),
                settings: RouteSettings(name: AppRouter.menuMyTicket));

          case AppRouter.webViewChoiceHallRental:
            return MaterialPageRoute(
                builder: (context) => WebViewChoiceHallRental(
                      item: settings.arguments as ChoiceModel,
                    ),
                settings:
                    RouteSettings(name: AppRouter.webViewChoiceHallRental));

          case AppRouter.webViewChoiceCgvStore:
            return MaterialPageRoute(
                builder: (context) => WebViewChoiceCgvStore(),
                settings: RouteSettings(name: AppRouter.webViewChoiceCgvStore));

          case AppRouter.webViewChoiceSweetbox:
            return MaterialPageRoute(
                builder: (context) => WebViewChoiceSweetbox(),
                settings: RouteSettings(name: AppRouter.webViewChoiceSweetbox));

          case AppRouter.webViewChoiceImax:
            return MaterialPageRoute(
                builder: (context) => WebViewChoiceImax(),
                settings: RouteSettings(name: AppRouter.webViewChoiceImax));

          case AppRouter.webViewChoice4dx:
            return MaterialPageRoute(
                builder: (context) => WebViewChoice4dx(),
                settings: RouteSettings(name: AppRouter.webViewChoice4dx));

          case AppRouter.webViewChoiceEntertaiment:
            return MaterialPageRoute(
                builder: (context) => WebViewChoiceEntertaiment(),
                settings:
                    RouteSettings(name: AppRouter.webViewChoiceEntertaiment));

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
