import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Login/components/background.dart';
import 'package:scmes_lite/Screens/Login/components/sign_form.dart';
import 'package:scmes_lite/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'GmarketSans',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Image.asset(
              "assets/images/login_image.png",
              height: size.height * 0.28,
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: SignForm(),
            ),
          ],
        ),
      ),
    );
  }
}
