import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';

class AddWordFormWidget extends StatelessWidget {
  const AddWordFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: _BorderStyle(),
            focusedBorder: _BorderStyle(),
          ),
        ),
        const SizedBox(height: 12),
      ],
    ));
  }

  OutlineInputBorder _BorderStyle() => OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.white, width: 2));
}
