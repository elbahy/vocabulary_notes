import 'package:flutter/material.dart';

class AddWordButtonWidget extends StatelessWidget {
  const AddWordButtonWidget({
    super.key,
    required this.colorCode,
  });

  final int colorCode;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          foregroundColor: Color(colorCode),
          fixedSize: const Size(120, 50),
        ),
        child: const Text('Add Word'));
  }
}
