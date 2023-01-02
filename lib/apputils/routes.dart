import 'package:flutter/material.dart';
import '../screens/dashboard.dart';
import '../screens/login.dart';

class Routes{
  static const String login = '/login';
  static const String dashboard = '/dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if(settings.name == login){
      return MaterialPageRoute(builder: (context) => const Login());
    }
    else if(settings.name == dashboard){
      return MaterialPageRoute(builder: (context) => const Dashboard());
    }
    else {
      return MaterialPageRoute(builder: (context) => const Login());
    }
  }
}