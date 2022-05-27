import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Home/home_screen.dart';
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
          children: [buildHeader(context), buildMenuItem(context)],
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
            '삼천산업 MES Lite',
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
            title: Text('홈'),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('삼천산업(예시)'),
            children: [
              DrawerSubMenu(
                subMenuName: '- 가전사업부',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- SMT사업부',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- 솔루션사업부',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('솔루션사업부(예시)'),
            children: [
              DrawerSubMenu(
                subMenuName: '- PI팀',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- 운영관리팀',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- 프로젝트팀',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              DrawerSubMenu(
                subMenuName: '- S/W팀',
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('삼천산업 시스템(예시)'),
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
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('로그아웃'),
            onTap: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
