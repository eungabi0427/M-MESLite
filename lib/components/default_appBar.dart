import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scmes_lite/constants.dart';

class defaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const defaultAppBar({
    Key? key,
    required this.appBar,
  }) : super(key: key);

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
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
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
