class WordModel {
  final int id;
  final String word;
  final bool isArabicWord;
  final int color;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.id,
    required this.word,
    required this.isArabicWord,
    required this.color,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel decrementId() {
    return WordModel(
      id: id - 1,
      word: word,
      isArabicWord: isArabicWord,
      color: color,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addSimilarWord(String similarWord, bool isArabic) {
    return WordModel(
      id: id,
      word: word,
      isArabicWord: isArabicWord,
      color: color,
      arabicSimilarWords: isArabic ? [...arabicSimilarWords, similarWord] : [...arabicSimilarWords],
      englishSimilarWords: isArabic ? [...englishSimilarWords] : [...englishSimilarWords, similarWord],
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel removeSimilarWord(String similarWord, bool isArabic) {
    return WordModel(
      id: id,
      word: word,
      isArabicWord: isArabicWord,
      color: color,
      arabicSimilarWords: isArabic ? arabicSimilarWords.where((word) => word != similarWord).toList() : arabicSimilarWords,
      englishSimilarWords: isArabic ? englishSimilarWords : englishSimilarWords.where((word) => word != similarWord).toList(),
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addExample(String example, bool isArabic) {
    return WordModel(
      id: id,
      word: word,
      isArabicWord: isArabicWord,
      color: color,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabic ? [...arabicExamples, example] : [...arabicExamples],
      englishExamples: isArabic ? [...englishExamples] : [...englishExamples, example],
    );
  }

  WordModel removeExample(String example, bool isArabic) {
    return WordModel(
      id: id,
      word: word,
      isArabicWord: isArabicWord,
      color: color,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabic ? arabicExamples.where((word) => word != example).toList() : arabicExamples,
      englishExamples: isArabic ? englishExamples : englishExamples.where((word) => word != example).toList(),
    );
  }
}
