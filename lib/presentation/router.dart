import 'package:birthday_manager/presentation/screen/login/sc_login.dart';
import 'package:birthday_manager/presentation/screen/register/sc_register.dart';
import 'package:flutter/material.dart';
import 'screen/home/sc_home.dart';

class AppRouter {
  static const String HOME = '/';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
