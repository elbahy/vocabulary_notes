import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';

class AddExampleOrSimilarWordButton extends StatelessWidget {
  const AddExampleOrSimilarWordButton({
    super.key,
    required this.color,
    required this.onPressed,
  });

  final int color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(backgroundColor: Color(color), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
        icon: const Icon(
          Icons.add,
          color: AppColors.black,
        ));
  }
}
