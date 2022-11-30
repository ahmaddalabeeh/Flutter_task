import 'package:flutter/material.dart';

class ConstantText extends StatelessWidget {
  const ConstantText({super.key, required this.text});
  final String text;

  final TextStyle _textStyle = const TextStyle(
      fontSize: 26,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 2);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _textStyle,
    );
  }
}
