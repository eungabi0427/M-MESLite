import 'package:flutter/material.dart';
import 'package:scmes_lite/constants.dart';

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Icon(
        icon,
        color: purple,
      ),
    );
  }
}
