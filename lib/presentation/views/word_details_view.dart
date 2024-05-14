import 'package:flutter/material.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.word});

  final WordModel word;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(word.color),
        title: const Text('Word Details'),
      ),
    );
  }
}
