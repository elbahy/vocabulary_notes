import 'package:hive_flutter/adapters.dart';
import 'package:vocabulary_notes/data/model/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      id: reader.read(),
      word: reader.readString(),
      isArabicWord: reader.readBool(),
      color: reader.read(),
      arabicSimilarWords: reader.readStringList(),
      englishSimilarWords: reader.readStringList(),
      arabicExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.write(obj.id);
    writer.writeString(obj.word);
    writer.writeBool(obj.isArabicWord);
    writer.write(obj.color);
    writer.writeStringList(obj.arabicSimilarWords);
    writer.writeStringList(obj.englishSimilarWords);
    writer.writeStringList(obj.arabicExamples);
    writer.writeStringList(obj.englishExamples);
  }
}
