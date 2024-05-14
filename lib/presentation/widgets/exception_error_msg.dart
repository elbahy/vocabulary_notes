import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';

class ExceptionErrorMsg extends StatelessWidget {
  const ExceptionErrorMsg({
    super.key,
    required this.icon,
    required this.msg,
  });

  final IconData icon;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, size: 100, color: AppColors.grey),
        Text(
          msg,
          style: const TextStyle(color: AppColors.grey, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
