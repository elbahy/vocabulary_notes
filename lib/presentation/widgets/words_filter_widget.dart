import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/core/functions/convert_langs_enum_to_string.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_state.dart';
import 'package:vocabulary_notes/presentation/widgets/words_filter_dialog_widget.dart';

class WordsFilterWidget extends StatelessWidget {
  const WordsFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              convertLangsEnumToString(ReadDataCubit.get(context).langugeFilter),
              style: const TextStyle(color: AppColors.white, fontSize: 20),
            ),
            IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => const WordsFilterDialogWidget());
                },
                style: IconButton.styleFrom(backgroundColor: AppColors.white),
                icon: const Icon(
                  Icons.filter_list,
                  color: AppColors.black,
                ))
          ],
        );
      },
    );
  }
}
