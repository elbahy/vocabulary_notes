import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_notes/presentation/cubit/write_data_cubit/write_data_state.dart';
import 'package:vocabulary_notes/presentation/widgets/add_word_button_widget.dart';
import 'package:vocabulary_notes/presentation/widgets/add_word_form_widget.dart';
import 'package:vocabulary_notes/presentation/widgets/color_selector_item.dart';
import 'package:vocabulary_notes/presentation/widgets/language_selector_item.dart';

class AddWordDialog extends StatelessWidget {
  const AddWordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<WriteDataCubit, WriteDataState>(
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            height: 320,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(WriteDataCubit.get(context).color),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                LanguageSelector(isArabicSelected: WriteDataCubit.get(context).isArabic),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ColorSelectorItem(
                          selectedcolor: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: ColorSelectorItem.colorsList.length),
                ),
                const AddWordFormWidget(),
                Align(alignment: Alignment.centerRight, child: AddWordButtonWidget(colorCode: WriteDataCubit.get(context).color)),
              ],
            ),
          );
        },
      ),
    );
  }
}
