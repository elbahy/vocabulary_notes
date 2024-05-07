import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';

class ColorSelectorItem extends StatelessWidget {
  const ColorSelectorItem({super.key, required this.selectedcolor});

  final int selectedcolor;
  static final List<int> colorsList = [
    0xff00008B, // أزرق داكن
    0xff556B2F, // أخضر زيتوني
    0xff8B4513, // بني داكن
    0xff2F4F4F, // رمادي داكن
    0xff9400D3, // بنفسجي داكن
    0xff708090, // رصاصي
    0xff00CED1, // تركواز داكن
    0xff800000, // بورجوندي
    0xff008080, // بترولي
    0xffFF8C00, // كحلي
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
