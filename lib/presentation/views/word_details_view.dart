import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';
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
      body: Column(
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
                  for (int x = 0; x < word.arabicSimilarWords.length; x++) WordInfoWidget(word: word.arabicSimilarWords[x], isArabic: true, color: word.color),
                  for (int x = 0; x < word.englishSimilarWords.length; x++) WordInfoWidget(word: word.englishSimilarWords[x], isArabic: false, color: word.color),

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
                  for (int x = 0; x < word.arabicExamples.length; x++) WordInfoWidget(word: word.arabicExamples[x], isArabic: true, color: word.color),
                  for (int x = 0; x < word.englishExamples.length; x++) WordInfoWidget(word: word.englishExamples[x], isArabic: false, color: word.color),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
