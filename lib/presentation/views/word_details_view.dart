import 'package:flutter/material.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Word', style: TextStyle(fontSize: 20, color: Color(word.color))),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Color(word.color),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.black,
                    child: Text(
                      word.isArabicWord ? 'ar' : 'en',
                      style: TextStyle(color: Color(word.color), fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      word.word,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.black, fontSize: 30),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Similar Words',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(word.color),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(backgroundColor: Color(word.color), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.black,
                    ))
              ],
            ),
            const Row(),
          ]),
        ),
      ),
    );
  }
}
