import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/widgets/add_word_dialog_widget.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const AddWordDialog(),
        );
      },
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: AppColors.black,
        size: 30,
      ),
    );
  }
}
