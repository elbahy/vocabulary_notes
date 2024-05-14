import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_notes/core/constants/hive_constants.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';
import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_state.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit() : super(ReadDataInitial());

  LangugeFilter langugeFilter = LangugeFilter.all;
  SortedBy sortedBy = SortedBy.time;
  Sortedtype sortedtype = Sortedtype.ascending;

  static ReadDataCubit get(context) => BlocProvider.of<ReadDataCubit>(context);
  final _box = Hive.box(HiveConstants.wordsBox);

  void changeLangugeFilter(LangugeFilter filter) {
    langugeFilter = filter;
    getWords();
  }

  void changeSortedBy(SortedBy sortBy) {
    sortedBy = sortBy;
    getWords();
  }

  void changeSortedType(Sortedtype sortType) {
    sortedtype = sortType;
    getWords();
  }

  void getWords() async {
    emit(ReadDataLoading());
    try {
      List<WordModel> words = List.from(_box.get(HiveConstants.wordsList, defaultValue: [])).cast<WordModel>();
      words = filterLanguageWords(words);
      words = sortWords(words);
      emit(ReadDataSuccess(words: words));
    } catch (e) {
      emit(ReadDataFailure(message: e.toString()));
    }
  }

  List<WordModel> filterLanguageWords(List<WordModel> words) {
    if (langugeFilter == LangugeFilter.all) {
      return words;
    }
    if (langugeFilter == LangugeFilter.arabic) {
      return words.where((element) => element.isArabicWord).toList();
    } else {
      return words.where((element) => !element.isArabicWord).toList();
    }
  }

  List<WordModel> sortWords(List<WordModel> words) {
    if (sortedBy == SortedBy.time) {
      if (sortedtype == Sortedtype.ascending) {
        return words;
      } else {
        return words..sort((a, b) => b.id.compareTo(a.id));
      }
    }
    if (sortedBy == SortedBy.length) {
      if (sortedtype == Sortedtype.ascending) {
        return words..sort((a, b) => a.word.length.compareTo(b.word.length));
      } else {
        return words..sort((a, b) => b.word.length.compareTo(a.word.length));
      }
    }
    return words;
  }
}

enum LangugeFilter {
  english,
  arabic,
  all,
}

enum SortedBy {
  time,
  length,
}

enum Sortedtype {
  ascending,
  descending,
}
