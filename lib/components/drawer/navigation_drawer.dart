import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Home/home_screen.dart';
import 'package:scmes_lite/Screens/Inventory/inv_lot_due_screen.dart';
import 'package:scmes_lite/Screens/Login/login_screen.dart';
import 'package:scmes_lite/components/drawer/drawer_subMenu.dart';
import 'package:scmes_lite/constants.dart';
import 'package:scmes_lite/size_config.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context),
            /*InkWell(
              onTap: () {},
              child: Container(
                height: getProportionateScreenHeight(71),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: getProportionateScreenWidth(17)),
                child: Icon(
                  Icons.close,
                  color: Color(0xFFE96977),
                  size: getProportionateScreenWidth(34),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFFB5E74).withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(getProportionateScreenWidth(36)),
                      topLeft: Radius.circular(getProportionateScreenWidth(36)),
                    )),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: mainGradientColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          )),
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(
        children: const [
          Text(
            '???????????? MES Lite',
            style: TextStyle(
              fontSize: 26,
              color: red,
              fontFamily: 'GmarketSans',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Changjin SC',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'GmarketSans',
            ),
          ),
        ],
      ),
    );
  }

  buildMenuItem(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(5)),
      child: Wrap(
        runSpacing: 2, // vertical spacing
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('???'),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('????????????(??????)'),
            children: [
              DrawerSubMenu(
                subMenuName: '- ????????????',
                press: () {
                  Navigator.pushNamed(context, InvLotDueScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- SMT?????????',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- ??????????????????',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('??????????????????(??????)'),
            children: [
              DrawerSubMenu(
                subMenuName: '- PI???',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- ???????????????',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- ???????????????',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- S/W???',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('???????????? ?????????(??????)'),
            children: [
              DrawerSubMenu(
                subMenuName: '- ERP',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- MES',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ],
          ),
          const Divider(color: Colors.black54),
          Stack(
            children: [
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('????????????'),
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ],
            /*child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('????????????'),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),*/
          ),
        ],
      ),
    );
  }
}
