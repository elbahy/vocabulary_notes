import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.isArabicSelected,
  });

  final bool isArabicSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        languageSelectorItem(context, true),
        const SizedBox(width: 10),
        languageSelectorItem(context, false),
      ],
    );
  }

  GestureDetector languageSelectorItem(BuildContext context, bool isArabicItem) {
    return GestureDetector(
      onTap: () {
        WriteDataCubit.get(context).changeIsArabic(isArabicItem);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 2),
          color: isArabicSelected == isArabicItem ? AppColors.white : Color(WriteDataCubit.get(context).color),
        ),
        child: Center(
            child: Text(
          isArabicItem ? 'ar' : 'en',
          style: TextStyle(color: isArabicSelected == isArabicItem ? Color(WriteDataCubit.get(context).color) : AppColors.white, fontWeight: FontWeight.bold, fontSize: 17),
        )),
      ),
    );
  }
}
