import 'package:vocabulary_notes/presentation/cubit/read_data_cubit/read_data_cubit.dart';

String convertLangsEnumToString(LangugeFilter lang) {
  switch (lang) {
    case LangugeFilter.english:
      return 'English Words';
    case LangugeFilter.arabic:
      return 'Arabic Words';
    case LangugeFilter.all:
      return 'All Words';
  }
}
