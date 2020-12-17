import 'package:flutter/material.dart';

class KeyboardRow extends StatelessWidget {
  final String rowLetters;

  KeyboardRow(this.rowLetters);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: rowLetters.split('').map<Widget>((String ch) {
          return Text(ch);
        }).toList(),
      ),
    );
  }
}
