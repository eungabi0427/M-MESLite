import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Inventory/components/body.dart';
import 'package:scmes_lite/components/default_appBar.dart';
import 'package:scmes_lite/components/drawer/navigation_drawer.dart';

class InvLotDueScreen extends StatelessWidget {
  static String routeName = "/invlotdue";
  const InvLotDueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(appBar: AppBar(), appBarName: '재고실사'),
      body: Body(),
      drawer: NavigationDrawer(),
    );
  }
}
