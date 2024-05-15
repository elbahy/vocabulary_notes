import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_state.dart';
import 'package:vocabulary_notes/presentation/widgets/add_word_button_widget.dart';
import 'package:vocabulary_notes/presentation/widgets/add_word_form_widget.dart';
import 'package:vocabulary_notes/presentation/widgets/language_selector_item.dart';

class AddExampleOrSimilarWordDialog extends StatelessWidget {
  const AddExampleOrSimilarWordDialog({
    super.key,
    required this.bgcolor,
    this.isSimilarWord = false,
    this.isExample = false,
    required this.wordId,
  });

  final int bgcolor;
  final int wordId;
  final bool isSimilarWord;
  final bool isExample;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<WriteDataCubit, WriteDataState>(
      listener: (context, state) {
        if (state is WriteDataSuccess) {
          Navigator.pop(context);
        } else if (state is WriteDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Dialog(
          backgroundColor: Color(bgcolor),
          child: Container(
            height: 250,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                LanguageSelector(isArabicSelected: WriteDataCubit.get(context).isArabic),
                const SizedBox(height: 20),
                AddWordFormWidget(formKey: formKey, isExample: isExample, isSimilarWord: isSimilarWord),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: AddWordButtonWidget(
                    colorCode: WriteDataCubit.get(context).color,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        isSimilarWord
                            ? WriteDataCubit.get(context).addSimilarWords(wordId)
                            : isExample
                                ? WriteDataCubit.get(context).addExample(wordId)
                                : null;
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
