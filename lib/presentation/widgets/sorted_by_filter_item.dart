import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';

class SortedByFilterItem extends StatelessWidget {
  const SortedByFilterItem({
    super.key,
    required this.sortedByFilter,
    required this.sortedByText,
    required this.onTap,
  });

  final SortedBy sortedByFilter;
  final String sortedByText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.white), borderRadius: const BorderRadius.all(Radius.circular(12)), color: sortedByFilter == ReadDataCubit.get(context).sortedBy ? AppColors.white : AppColors.black),
        child: Text(
          sortedByText,
          style: TextStyle(
            color: sortedByFilter == ReadDataCubit.get(context).sortedBy ? AppColors.black : AppColors.white,
          ),
        ),
      ),
    );
  }
}
