import 'package:flutter/material.dart';
import 'constants/constants.dart';
//import HomeScrean
import 'package:movie_app/presentation/HomeScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) =>
            HomeScreen());

        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
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