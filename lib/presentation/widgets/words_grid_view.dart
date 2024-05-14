import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_state.dart';

class WordsGridView extends StatelessWidget {
  const WordsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        if (state is ReadDataSuccess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 2 / 1.5),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(state.words[index].color),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      state.words[index].word,
                      style: const TextStyle(color: AppColors.white, fontSize: 20),
                    ),
                  ),
                );
              },
              itemCount: state.words.length,
            ),
          );
        } else if (state is ReadDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          return Container(); // يمكنك استبداله بواجهة مستخدمية تخبر المستخدم بحالة الفشل
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
