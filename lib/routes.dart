import 'package:flutter/cupertino.dart';
import 'package:scmes_lite/Screens/Home/home_screen.dart';
import 'package:scmes_lite/Screens/Login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
