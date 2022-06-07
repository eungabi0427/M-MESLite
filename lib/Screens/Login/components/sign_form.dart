import 'package:flutter/material.dart';
import 'package:scmes_lite/Screens/Home/home_screen.dart';
import 'package:scmes_lite/components/form_error.dart';
import 'package:scmes_lite/components/rounded_button.dart';
import 'package:scmes_lite/components/suffix_icon.dart';
import 'package:scmes_lite/constants.dart';
import 'package:scmes_lite/helper/keyboard.dart';
import 'package:scmes_lite/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String id;
  late String password;
  String userInfo = ""; // user의 정보를 저장하기 위한 변수
  bool remember = false;
  bool isHiddenPassword = true;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildIdFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(isHiddenPassword),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: remember,
                  activeColor: red,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                Text('로그인정보 기억하기 ')
              ],
            ),
            FormError(size: size, errors: errors),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // If all are valid then go to main screen
                  KeyboardUtil.hideKeyboard(context);
                  Navigator.pushNamed(context, HomeScreen.routeName);
                  //scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text('로그인 성공')));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('로그인성공'),
                    duration: Duration(seconds: 2),
                    backgroundColor: blue.withOpacity(0.5),
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              /*press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                String objText, objText1, objText2, objBody;
                objText1 = '$id';
                objText2 = '$password';
                //objText = '[{"id": "$id", "pwd": "$password"}]';
                objBody = '<?xml version="1.0" encoding="utf-8"?>' +
                    '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
                    '<soap:Body>' +
                    '<Response_SearchData xmlns="http://tempuri.org/">' +
                    //'<searchDataID>$objText</searchDataID>' +
                    '<searchDataID>$objText1</searchDataID>' +
                    '<searchDataPWD>$objText2</searchDataPWD>' +
                    '</Response_SearchData>' +
                    '</soap:Body>' +
                    '</soap:Envelope>';

                final response = await http.post(Uri.parse("http://192.168.101.241:62845/Login.asmx"),
                    body: objBody,
                    headers: {
                      'Content-Type': 'text/xml; charset=utf-8',
                      'SOAPAction': "http://tempuri.org/Response_SearchData"
                    });

                print('로그인성공');
                Navigator.pushNamed(context, HomeScreen.routeName);
              },*/
            )
          ],
        ));
  }

  TextFormField buildPasswordFormField(bool isHiddenPassword) {
    return TextFormField(
      obscureText: isHiddenPassword,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 1) {
          removeError(error: kMatchPassError);
          /*setState(() {
            errors.remove(kMatchPassError);
          });*/
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          /*setState(() {
            errors.add(kPassNullError);
          });*/
          return "";
        } else if (value.length < 1) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: '비밀번호',
        hintText: '비밀번호를 입력하세요',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.only(right: 20),
          onPressed: tooglePasswordView,
          icon: Icon(
            isHiddenPassword ? Icons.visibility_off : Icons.visibility,
            color: purple,
          ),
        ),
      ),
    );
  }

  TextFormField buildIdFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => id = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kIdNullError);
        } else if (idValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidIdError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kIdNullError);
          return "";
        } else if (!idValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidIdError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: '아이디',
        hintText: '아이디를 입력하세요',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIcon(icon: Icons.person),
      ),
    );
  }

  void tooglePasswordView() {
    /*if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }*/
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
