import 'package:flutter/material.dart';
import 'package:scmes_lite/size_config.dart';

class DrawerSubMenu extends StatelessWidget {
  const DrawerSubMenu({
    Key? key,
    required this.subMenuName,
    required this.press,
  }) : super(key: key);

  final String subMenuName;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        title: Text(
          subMenuName, // ex)'- 가전사업부',
          style: TextStyle(
            fontFamily: 'Pretendard',
          ),
        ),
        onTap: press
        /*() {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }*/
        );
  }
}
