import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Login/login_screen.dart';
import 'package:scmes_lite/routes.dart';
import 'package:scmes_lite/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 상단 DEBUG 배너 제거
      title: 'samco MES Lite',
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
