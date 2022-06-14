import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scmes_lite/components/form_error.dart';
import 'package:scmes_lite/components/rounded_button.dart';
import 'package:scmes_lite/components/suffix_icon.dart';
import 'package:scmes_lite/constants.dart';
import 'package:scmes_lite/helper/keyboard.dart';
import 'package:scmes_lite/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  bool isHiddenPassword = true;
  final List<String> errors = [];

  bool remember = false;
  final TextEditingController _idController = TextEditingController();
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
        _idController.text = _email;
        _passwordController.text = _password;
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
        return;
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
      controller: _idController,
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
        prefs.setString('email', _idController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      remember = value;
    });
  }

  Future<void> _callAPI() async {
    String objText;
    objText =
        '[{ "serviceId" : "SYS_View_User_List","procCode" : "1","inMsg" : {"userId" : ${_idController.text},"password" : ${_passwordController.text}}]';
    print('objText : $objText');

    var url = Uri.parse('http://192.168.101.241:44300/WebService.asmx/Login');
    /* GET 방식 */
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    /* POST 방식 */
    response = await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        'json': objText,
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
