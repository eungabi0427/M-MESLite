import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:scmes_lite/constants.dart';

class IconBtnSearch extends StatefulWidget {
  const IconBtnSearch({Key? key}) : super(key: key);

  @override
  State<IconBtnSearch> createState() => _IconBtnSearchState();
}

late String lotID = 'sc21087';

class _IconBtnSearchState extends State<IconBtnSearch> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        String objText, objBody;
        objText = '$lotID';
        objBody = '<?xml version="1.0" encoding="utf-8"?>' +
            '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
            '<soap:Body>' +
            '<Response_SearchData xmlns="http://tempuri.org/">' +
            '<lotID>$objText</lotID>' +
            '</Response_SearchData>' +
            '</soap:Body>' +
            '</soap:Envelope>';

        final response = await http.post(Uri.parse("http://192.168.101.241:62845/InvLotDue.asmx"),
            body: objBody,
            headers: {
              'Content-Type': 'text/xml; charset=utf-8',
              'SOAPAction': "http://tempuri.org/Response_SearchData"
            });

        print('데이터가져오기 성공');
        print("responseBody: ${response.body}");
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.025),
        height: size.height * 0.05,
        width: size.width * 0.12,
        decoration: BoxDecoration(color: purple.withOpacity(0.1), shape: BoxShape.circle),
        child: SvgPicture.asset("assets/icons/search.svg"),
      ),
    );
  }
}
