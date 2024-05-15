import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({
    super.key,
    required this.word,
    required this.isArabic,
    required this.color,
  });

  final String word;
  final bool isArabic;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: Color(color),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.black,
            child: Text(
              isArabic ? 'ar' : 'en',
              style: TextStyle(color: Color(color), fontSize: 20),
            ),
          ),
          Expanded(
            child: Text(
              word,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.black, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
