import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_state.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_notes/presentation/widgets/add_example_or_similar_dialog.dart';
import 'package:vocabulary_notes/presentation/widgets/add_example_or_similar_word_button.dart';
import 'package:vocabulary_notes/presentation/widgets/heading_text_widget.dart';
import 'package:vocabulary_notes/presentation/widgets/word_info_widget.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.word});

  final WordModel word;
  @override
  Widget build(BuildContext context) {
    WordModel updatedWord = word;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(word.color),
        title: Text(
          'Word Details',
          style: TextStyle(color: Color(word.color)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              WriteDataCubit.get(context).deleteWord(word.id);
              Navigator.pop(context);
            },
            color: Color(word.color),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: BlocConsumer<ReadDataCubit, ReadDataState>(
        listener: (context, state) {
          if (state is ReadDataSuccess) {
            updatedWord = state.words.firstWhere((element) => element.id == word.id);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // Word Info Section
              HeadingText(text: 'Word', color: word.color),
              const SizedBox(height: 15),
              WordInfoWidget(
                word: word.word,
                isArabic: word.isArabicWord,
                color: word.color,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      // Similar Words Info Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadingText(text: 'Similar Words', color: word.color),
                          AddExampleOrSimilarWordButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AddExampleOrSimilarWordDialog(
                                          bgcolor: word.color,
                                          isSimilarWord: true,
                                          wordId: word.id,
                                        ));
                              },
                              color: word.color)
                        ],
                      ),
                      const SizedBox(height: 15),
                      for (int x = 0; x < updatedWord.arabicSimilarWords.length; x++)
                        WordInfoWidget(
                          word: updatedWord.arabicSimilarWords[x],
                          isArabic: true,
                          color: word.color,
                          onPressed: () => removeArabicSimilarWord(context, x, updatedWord.arabicSimilarWords[x]),
                        ),
                      for (int x = 0; x < updatedWord.englishSimilarWords.length; x++)
                        WordInfoWidget(
                          word: updatedWord.englishSimilarWords[x],
                          isArabic: false,
                          color: word.color,
                          onPressed: () => removeEnglishSimilarWord(context, x, updatedWord.englishSimilarWords[x]),
                        ),

                      // Examples Info Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadingText(text: 'Examples', color: word.color),
                          AddExampleOrSimilarWordButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AddExampleOrSimilarWordDialog(
                                          bgcolor: word.color,
                                          isExample: true,
                                          wordId: word.id,
                                        ));
                              },
                              color: word.color)
                        ],
                      ),
                      const SizedBox(height: 15),
                      for (int x = 0; x < updatedWord.arabicExamples.length; x++)
                        WordInfoWidget(
                          word: updatedWord.arabicExamples[x],
                          isArabic: true,
                          color: word.color,
                          onPressed: () => removeArabicExample(context, word.id, updatedWord.arabicExamples[x]),
                        ),
                      for (int x = 0; x < updatedWord.englishExamples.length; x++)
                        WordInfoWidget(
                          word: updatedWord.englishExamples[x],
                          isArabic: false,
                          color: word.color,
                          onPressed: () => removeEnglishExample(context, word.id, updatedWord.englishExamples[x]),
                        ),
                    ]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  removeArabicSimilarWord(BuildContext context, int x, String similarWord) {
    WriteDataCubit.get(context).removeSimilarWords(x, true, similarWord);
    ReadDataCubit.get(context).getWords();
  }

  removeEnglishSimilarWord(BuildContext context, int x, String similarWord) {
    WriteDataCubit.get(context).removeSimilarWords(x, false, similarWord);
    ReadDataCubit.get(context).getWords();
  }

  removeArabicExample(BuildContext context, int x, String example) {
    WriteDataCubit.get(context).removeExample(x, true, example);
    ReadDataCubit.get(context).getWords();
  }

  removeEnglishExample(BuildContext context, int x, String example) {
    WriteDataCubit.get(context).removeExample(x, false, example);
    ReadDataCubit.get(context).getWords();
  }
}
