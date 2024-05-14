import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';

class SortingTypeFilterItem extends StatelessWidget {
  const SortingTypeFilterItem({super.key, required this.sortedtype, required this.sortedTypeText, required this.onTap});

  final Sortedtype sortedtype;
  final String sortedTypeText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ReadDataCubit.get(context).changeSortedType(sortedtype);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.white), borderRadius: const BorderRadius.all(Radius.circular(12)), color: sortedtype == ReadDataCubit.get(context).sortedtype ? AppColors.white : AppColors.black),
        child: Text(
          sortedTypeText,
          style: TextStyle(
            color: sortedtype == ReadDataCubit.get(context).sortedtype ? AppColors.black : AppColors.white,
          ),
        ),
      ),
    );
  }
}
