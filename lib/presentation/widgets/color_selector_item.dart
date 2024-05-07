import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';

class ColorSelectorItem extends StatelessWidget {
  const ColorSelectorItem({super.key, required this.selectedcolor});

  final int selectedcolor;
  static final List<int> colorsList = [
    0xff0000FF,
    0xffADD8E6, // الأزرق الفاتح
    0xff90EE90, // الأخضر الفاتح
    0xff008000, // الأخضر الغامق
    0xffFF0000, // الأحمر
    0xffFFA500, // البرتقالي
    0xff000000, // الأسود
    0xffFFFF00, // الأصفر
    0xffFFC0CB, // الوردي
    0xff800080, // الأرجواني
    // الأزرق الغامق
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WriteDataCubit.get(context).changeColor(colorsList[selectedcolor]);
      },
      child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: WriteDataCubit.get(context).color == colorsList[selectedcolor] ? Border.all(color: AppColors.white, width: 2) : null,
            color: Color(colorsList[selectedcolor]),
          ),
          child: WriteDataCubit.get(context).color == colorsList[selectedcolor]
              ? const Icon(
                  Icons.done,
                  color: AppColors.white,
                )
              : null),
    );
  }
}
