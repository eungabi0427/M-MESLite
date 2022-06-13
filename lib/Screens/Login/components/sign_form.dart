import 'dart:convert' show jsonDecode, utf8;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scmes_lite/components/form_error.dart';
import 'package:scmes_lite/components/rounded_button.dart';
import 'package:scmes_lite/components/suffix_icon.dart';
import 'package:scmes_lite/constants.dart';
import 'package:scmes_lite/helper/keyboard.dart';
import 'package:scmes_lite/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml2json/xml2json.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  List<User> listModel = [];

  bool isHiddenPassword = true;
  final List<String> errors = [];

  bool remember = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserEmailPassword();
  }

  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _rememberMe = _prefs.getBool("remember_me") ?? false;

      print(_rememberMe);
      print(_email);
      print(_password);
      if (_rememberMe) {
        setState(() {
          remember = true;
        });
        _emailController.text = _email ?? "";
        _passwordController.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    Xml2Json xml2json = Xml2Json();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildIdFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(isHiddenPassword),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: remember,
                    activeColor: red,
                    onChanged: _handleRememberMe,
                  ),
                  const Text('로그인정보 기억하기 ')
                ],
              ),
            ),
            FormError(size: size, errors: errors),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('정규식 성공');
                  _callAPI();
                  KeyboardUtil.hideKeyboard(context);
                  //Navigator.pushNamed(context, HomeScreen.routeName);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('로그인성공'),
                    duration: Duration(seconds: 2),
                    backgroundColor: blue.withOpacity(0.5),
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
            )
          ],
        ));
  }

  TextFormField buildPasswordFormField(bool isHiddenPassword) {
    return TextFormField(
      controller: _passwordController,
      obscureText: isHiddenPassword,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return "";
        } else if (value.isEmpty) {
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
      controller: _emailController,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kIdNullError);
        } else if (idValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidIdError);
        }
        return;
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
      decoration: const InputDecoration(
        labelText: '아이디',
        hintText: '아이디를 입력하세요',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIcon(icon: Icons.person),
      ),
    );
  }

  void tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _handleRememberMe(bool? value) {
    print("Handle Remember Me");
    remember = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      remember = value;
    });
  }

  void _callAPI() async {
    String objText1, objText2;
    objText1 = _emailController.text;
    objText2 = _passwordController.text;
    print('objText12  + $objText1 + $objText2');

    var url = Uri.parse("http://192.168.101.241:44300/WebService.asmx/Login");
    var response = await http.get(url);
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    var responseBody = response.body;

    print("statusCode: ${statusCode}");
    print("responseHeaders: ${responseHeaders}");
    print("responseBody: ${responseBody}");

    /*var usersJson = jsonDecode(responseBody)['getUser'];
    List<dynamic>? users = usersJson != null ? List.from(usersJson) : null;
    // usersJson이 true면 List.from(usersJson) false면 null
    print(users);*/

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      final items = (data['getUser'] as List).map((i) => User.fromJson(i));
      for (final item in items) {
        print(item.id);
        print(item.name);
      }
    }
  }
}

class User {
  String id;
  String name;
  User(this.id, this.name);
  factory User.fromJson(dynamic json) {
    return User(json['ID'] as String, json['Name'] as String);
  }
  @override
  String toString() {
    return '{ ${this.id}, ${this.name} }';
  }
}
