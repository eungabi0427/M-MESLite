import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Home/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(),
      ),
    );
  }
}
