import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/views/word_details_view.dart';

class WordsGridViewItem extends StatelessWidget {
  const WordsGridViewItem({
    super.key,
    required this.index,
    required this.words,
  });

  final int index;
  final List<WordModel> words;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => WordDetailsView(word: words[index]),
            ),
          )
          .then(
            (value) => Future.delayed(const Duration(seconds: 1)).then((value) => ReadDataCubit.get(context).getWords()),
          ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(words[index].color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            words[index].word,
            style: const TextStyle(color: AppColors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
