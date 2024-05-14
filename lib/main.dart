import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_notes/core/constants/hive_constants.dart';
import 'package:vocabulary_notes/core/styles/theme_manager.dart';
import 'package:vocabulary_notes/data/model/word_type_adapter.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_notes/presentation/views/home_view.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReadDataCubit()..getWords()),
        BlocProvider(create: (context) => WriteDataCubit()),
      ],
      child: MaterialApp(
        title: 'Vocabulary Notes',
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
        theme: ThemeManager.AppTheme,
      ),
    );
  }
}
