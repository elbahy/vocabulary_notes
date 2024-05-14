import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_state.dart';
import 'package:vocabulary_notes/presentation/widgets/exception_error_msg.dart';
import 'package:vocabulary_notes/presentation/widgets/words_grid_view_item.dart';

class WordsGridView extends StatelessWidget {
  const WordsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        if (state is ReadDataSuccess) {
          if (state.words.isEmpty) {
            return const ExceptionErrorMsg(msg: 'Empty Words List, Let\'s Words', icon: Icons.list_rounded);
          } else {
            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 2 / 1.5),
                itemBuilder: (context, index) {
                  return WordsGridViewItem(
                    index: index,
                    words: state.words,
                  );
                },
                itemCount: state.words.length,
              ),
            );
          }
        } else if (state is ReadDataFailure) {
          return ExceptionErrorMsg(msg: state.message, icon: Icons.error); // يمكنك استبداله بواجهة مستخدمية تخبر المستخدم بحالة الفشل
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
