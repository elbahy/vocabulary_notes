import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_notes/constants/hive_constants.dart';
import 'package:vocabulary_notes/data/model/word_type_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox(HiveConstants.wordsBox);
  runApp(const VocabularyNotesApp());
}

class VocabularyNotesApp extends StatelessWidget {
  const VocabularyNotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}
