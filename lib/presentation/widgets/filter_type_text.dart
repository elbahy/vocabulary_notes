import 'package:flutter/widgets.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';

class FilterTypeText extends StatelessWidget {
  const FilterTypeText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
        ));
  }
}
