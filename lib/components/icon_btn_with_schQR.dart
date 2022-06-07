import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scmes_lite/constants.dart';

class IconBtnWithSchQR extends StatelessWidget {
  const IconBtnWithSchQR({
    Key? key,
    required this.size,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final Size size;
  final String svgSrc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.025),
        height: size.height * 0.05,
        width: size.width * 0.12,
        decoration: BoxDecoration(color: purple.withOpacity(0.1), shape: BoxShape.circle),
        child: SvgPicture.asset(svgSrc),
      ),
    );
  }
}
