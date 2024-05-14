import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_state.dart';
import 'package:vocabulary_notes/presentation/widgets/filter_type_text.dart';
import 'package:vocabulary_notes/presentation/widgets/language_filter_item.dart';
import 'package:vocabulary_notes/presentation/widgets/sorted_by_filter_item.dart';
import 'package:vocabulary_notes/presentation/widgets/sorting_type_filter_item.dart';

class WordsFilterDialogWidget extends StatelessWidget {
  const WordsFilterDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: AppColors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FilterTypeText(text: 'Language:'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LanguageFilterItem(
                      langName: 'Arabic',
                      langugeFilter: LangugeFilter.arabic,
                      onTap: () => ReadDataCubit.get(context).changeLangugeFilter(LangugeFilter.arabic),
                    ),
                    LanguageFilterItem(
                      langName: 'English',
                      langugeFilter: LangugeFilter.english,
                      onTap: () => ReadDataCubit.get(context).changeLangugeFilter(LangugeFilter.english),
                    ),
                    LanguageFilterItem(
                      langName: 'All',
                      langugeFilter: LangugeFilter.all,
                      onTap: () => ReadDataCubit.get(context).changeLangugeFilter(LangugeFilter.all),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const FilterTypeText(text: 'Sorted By:'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SortedByFilterItem(
                      sortedByText: 'Time',
                      sortedByFilter: SortedBy.time,
                      onTap: () => ReadDataCubit.get(context).changeSortedBy(SortedBy.time),
                    ),
                    SortedByFilterItem(
                      sortedByText: 'Word Length',
                      sortedByFilter: SortedBy.length,
                      onTap: () => ReadDataCubit.get(context).changeSortedBy(SortedBy.length),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const FilterTypeText(text: 'Sorting Type:'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SortingTypeFilterItem(
                      sortedTypeText: 'Ascending',
                      sortedtype: Sortedtype.ascending,
                      onTap: () => ReadDataCubit.get(context).changeSortedType(Sortedtype.ascending),
                    ),
                    SortingTypeFilterItem(
                      sortedTypeText: 'Descending',
                      sortedtype: Sortedtype.descending,
                      onTap: () => ReadDataCubit.get(context).changeSortedType(Sortedtype.descending),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
