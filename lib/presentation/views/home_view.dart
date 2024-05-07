import 'package:flutter/material.dart';
import 'package:vocabulary_notes/presentation/widgets/custom_floating_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: const CustomFloatingButton(),
      body: const Column(),
    );
  }
}
