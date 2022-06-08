import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scmes_lite/components/qrcode/qr_scanner.dart';
import 'package:scmes_lite/constants.dart';

class IconBtnQRcode extends StatefulWidget {
  const IconBtnQRcode({Key? key}) : super(key: key);

  @override
  State<IconBtnQRcode> createState() => _IconBtnQRcodeState();
}

class _IconBtnQRcodeState extends State<IconBtnQRcode> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('큐알버튼 클릭');
        Navigator.push(
            // MaterialPageRoute로 안전 장치로 Builder를 사용해 Route기능으로 추가
            context,
            MaterialPageRoute(
              builder: (context) => QRScanner(),
            ));
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.025),
        height: size.height * 0.05,
        width: size.width * 0.12,
        decoration: BoxDecoration(color: purple.withOpacity(0.1), shape: BoxShape.circle),
        child: SvgPicture.asset("assets/icons/qrcode.svg"),
      ),
    );
  }
}
