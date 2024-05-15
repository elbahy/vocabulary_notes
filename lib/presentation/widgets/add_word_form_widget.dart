import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';

class AddWordFormWidget extends StatelessWidget {
  AddWordFormWidget({Key? key, required this.formKey, this.isExample = false, this.isSimilarWord = false}) : super(key: key);

  final GlobalKey<FormState> formKey;
  final bool isExample;
  final bool isSimilarWord;

  final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
  final englishRegex = RegExp(r'^[a-zA-Z\s]+$');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              enabledBorder: _borderStyle(),
              focusedBorder: _borderStyle(),
              border: _borderStyle(),
              labelText: isExample
                  ? 'New Example'
                  : isSimilarWord
                      ? 'New Similar Word'
                      : 'New Word',
              labelStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 17,
              ),
            ),
            onChanged: (value) {
              WriteDataCubit.get(context).changeText(value);
            },
            validator: (value) {
              if (WriteDataCubit.get(context).isArabic) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid Arabic word';
                } else if (!arabicRegex.hasMatch(value)) {
                  return 'Please enter a valid Arabic word';
                }
              } else {
                if (!(value != null && englishRegex.hasMatch(value))) {
                  return 'Please enter a valid English word';
                }
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  OutlineInputBorder _borderStyle() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.white, width: 2),
      );
}
