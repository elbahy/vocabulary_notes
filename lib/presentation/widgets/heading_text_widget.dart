import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 20, color: Color(color)));
  }
}
