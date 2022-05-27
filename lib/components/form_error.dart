import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.size,
    required this.errors,
  }) : super(key: key);

  final Size size;
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/error.svg",
          height: size.width * 0.04,
          width: size.width * 0.04,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(error),
      ],
    );
  }
}
