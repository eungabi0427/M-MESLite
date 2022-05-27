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
      //appBar: buildDefaultAppBar(),
      appBar: defaultAppBar(appBar: AppBar()),
      body: Body(),
      drawer: NavigationDrawer(),
    );
  }

  /*AppBar buildDefaultAppBar() {
    return AppBar(
      title: Text(
        '메인화면',
        style: TextStyle(fontFamily: 'Pretendard'),
      ),
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            print('menu button is clicked');
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        );
      }),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: mainGradientColor),
      ),
    );
  }*/
}
