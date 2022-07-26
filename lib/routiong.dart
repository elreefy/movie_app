 import 'package:flutter/material.dart';
import 'package:movie_app/presentation/description_screen.dart';
import 'package:movie_app/presentation/search_screen.dart';
import 'constants/constants.dart';
//import HomeScrean
import 'package:movie_app/presentation/HomeScreen.dart';
//hello
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {

      case homeScreen:
        return MaterialPageRoute(builder: (_) =>
            HomeScreen());
   //add arguments for movie details screen
      case movieDetails:
        return MaterialPageRoute(builder: (_) =>
            MovieDetails(
              movie: args,
            )
        );
      case searchScreen:
        return MaterialPageRoute(builder: (_) =>
            SearchScreen(
              expression: args,
            )
        );

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorOtp() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('otp'),
        ),
        body: Center(
          child: Text('otp'),
        ),
      );
    });
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}