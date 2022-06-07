import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Inventory/components/inventory_listview.dart';
import 'package:scmes_lite/components/header_with_searchbox.dart';
import 'package:scmes_lite/components/title_with_custom_underline.dart';
import 'package:scmes_lite/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithCustomUnderline(text: '재고정보'),
          SizedBox(height: kDefaultPadding / 2),
          Container(
            width: double.infinity,
            height: 200,
            color: backgroundColor,
            child: InventoryListView(),
            //child: InventoryListView(course: course),
          ),
          /*Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.4, vertical: kDefaultPadding * 0.1),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: gradPurpleEnd.withOpacity(0.5),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),*/
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          TitleWithCustomUnderline(text: '실사정보'),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: blue),
          ),
        ],
      ),
    );
  }
}
