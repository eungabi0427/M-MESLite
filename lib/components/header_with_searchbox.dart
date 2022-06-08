import 'package:flutter/material.dart';
import 'package:scmes_lite/components/icon_btn_qrcode.dart';
import 'package:scmes_lite/components/icon_btn_search.dart';
import 'package:scmes_lite/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  late String lotID;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
      // It will cover 20% of our total height
      height: size.height * 0.09,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.1 - 30,
            decoration: BoxDecoration(
                //color: blue,
                gradient: mainGradientColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              //alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.only(right: 15),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: blue.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'LOT ID 입력',
                        hintStyle: TextStyle(
                          color: blue.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly with SVG
                        // thats why we use row
                        //suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  IconBtnSearch(),
                  /*IconBtnWithSchQR(
                    size: size,
                    svgSrc: "assets/icons/search.svg",
                    press: () {
                      print('검색모양 버튼 누름');
                    },
                  ),*/
                  IconBtnQRcode(),
                  /*IconBtnWithSchQR(
                    size: size,
                    svgSrc: "assets/icons/qrcode.svg",
                    press: () {
                      print('큐알코드 버튼 누름');
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
