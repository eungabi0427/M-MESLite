import 'package:flutter/material.dart';

//const kPrimaryColor = Color(0xFF6F35A5);
const blue = Color(0xFF4D85E1);
const purple = Color(0xFF6F35A5);
const lightPurple = Color(0xFFF1E6FF);
const red = Color(0xFFBC4042);
const indigo = Color(0xFF142E6E);
const backgroundColor = Color(0xFFF8F8F8);
const shadowColor = Color(0xFFE6E6E6);
const gradGreenStart = Color(0xFF1C92A4);
const gradPurpleEnd = Color(0xFF805FFF);
const mainGradientColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [Color(0xFF1C92A4), Color(0xFF805FFF)],
);

const double kDefaultPadding = 20.0;

// Form Error
final RegExp idValidatorRegExp = RegExp(r'^[a-zA-Z0-9]+$');
const String kIdNullError = '아이디를 입력하세요';
const String kInvalidIdError = '아이디가 올바르지 않습니다.';
const String kPassNullError = '비밀번호를 입력하세요';
const String kMatchPassError = '비밀번호가 올바르지 않습니다.';
