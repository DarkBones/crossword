import 'package:crossword/src/widgets/keyboard/keyboard_key.dart';
import 'package:flutter/material.dart';

class KeyboardRow extends StatelessWidget {
  final String rowLetters;

  KeyboardRow(this.rowLetters);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowLetters.split('').map<Widget>((String ch) {
          return KeyboardKey(ch);
        }).toList(),
      ),
    );
  }
}
