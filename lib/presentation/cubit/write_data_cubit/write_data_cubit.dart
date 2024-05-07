import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vocabulary_notes/core/constants/hive_constants.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_state.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  WriteDataCubit() : super(WriteDataInitial());

  String text = "";
  int color = 0xff0000FF;
  bool isArabic = true;
  static get(context) => BlocProvider.of<WriteDataCubit>(context);
  final Box box = Hive.box(HiveConstants.wordsBox);

  void changeText(String text) {
    this.text = text;
  }

  void changeColor(int color) {
    this.color = color;
    emit(WriteDataInitial());
  }

  void changeIsArabic(bool isArabic) {
    this.isArabic = isArabic;
    emit(WriteDataInitial());
  }

  void addWord() {
    emit(WriteDataLoading());
    try {
      List<WordModel> words = List.from(box.get(HiveConstants.wordsList, defaultValue: [])).cast<WordModel>();
      words.add(WordModel(id: words.length, word: text, isArabicWord: isArabic, color: color));
      box.put(HiveConstants.wordsList, words);
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailure(message: e.toString()));
    }
  }

  void deleteWord(int id) {
    emit(WriteDataLoading());
    try {
      List<WordModel> words = _getWordsFromBox();
      words.removeAt(id);
      for (int i = id; i < words.length; i++) {
        words[i] = words[i].decrementId();
      }
      box.put(HiveConstants.wordsList, words);
    } catch (e) {
      emit(WriteDataFailure(message: e.toString()));
    }
  }

  void addSimilarWords(int id) {
    emit(WriteDataLoading());
    try {
      List<WordModel> words = _getWordsFromBox();
      words[id] = words[id].addSimilarWord(text, isArabic);
      box.put(HiveConstants.wordsList, words);
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailure(message: e.toString()));
    }
  }

  void removeSimilarWords(int id) {
    emit(WriteDataLoading());
    try {
      List<WordModel> words = _getWordsFromBox();
      words[id] = words[id].removeSimilarWord(text, isArabic);
      box.put(HiveConstants.wordsList, words);
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailure(message: e.toString()));
    }
  }

  void addExample(int id) {
    emit(WriteDataLoading());
    try {
      List<WordModel> words = _getWordsFromBox();
      words[id] = words[id].addExample(text, isArabic);
      box.put(HiveConstants.wordsList, words);
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailure(message: e.toString()));
    }
  }

  void removeExample(int id) {
    emit(WriteDataLoading());
    try {
      List<WordModel> words = _getWordsFromBox();
      words[id] = words[id].removeExample(text, isArabic);
      box.put(HiveConstants.wordsList, words);
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailure(message: e.toString()));
    }
  }

  List<WordModel> _getWordsFromBox() => List.from(box.get(HiveConstants.wordsList, defaultValue: [])).cast<WordModel>();
}
