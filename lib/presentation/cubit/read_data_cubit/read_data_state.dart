import 'package:vocabulary_notes/data/model/word_model.dart';

abstract class ReadDataState {}

class ReadDataInitial extends ReadDataState {}

class ReadDataLoading extends ReadDataState {}

class ReadDataSuccess extends ReadDataState {
  final List<WordModel> words;
  ReadDataSuccess({required this.words});
}

class ReadDataFailure extends ReadDataState {
  final String message;
  ReadDataFailure({required this.message});
}
