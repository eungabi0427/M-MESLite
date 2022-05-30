import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Home/components/body.dart';
import 'package:scmes_lite/components/default_appBar.dart';
import 'package:scmes_lite/components/drawer/navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        appBar: AppBar(),
        appBarName: '메인화면',
      ),
      body: Body(),
      drawer: NavigationDrawer(),
    );
  }
}
