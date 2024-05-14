import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';

class LanguageFilterItem extends StatelessWidget {
  const LanguageFilterItem({
    super.key,
    required this.langugeFilter,
    required this.langName,
    required this.onTap,
  });

  final LangugeFilter langugeFilter;
  final String langName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.white), borderRadius: const BorderRadius.all(Radius.circular(12)), color: langugeFilter == ReadDataCubit.get(context).langugeFilter ? AppColors.white : AppColors.black),
        child: Text(
          langName,
          style: TextStyle(
            color: langugeFilter == ReadDataCubit.get(context).langugeFilter ? AppColors.black : AppColors.white,
          ),
        ),
      ),
    );
  }
}
