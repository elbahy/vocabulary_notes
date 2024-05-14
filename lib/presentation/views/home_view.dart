import 'package:flutter/material.dart';
import 'package:vocabulary_notes/presentation/widgets/custom_floating_button.dart';
import 'package:vocabulary_notes/presentation/widgets/words_filter_widget.dart';
import 'package:vocabulary_notes/presentation/widgets/words_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: const CustomFloatingButton(),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            WordsFilterWidget(),
            SizedBox(height: 10),
            WordsGridView(),
          ],
        ),
      ),
    );
  }
}
