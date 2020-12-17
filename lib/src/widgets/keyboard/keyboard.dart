import 'package:flutter/material.dart';
import './keyboard_row.dart';

class Keyboard extends StatelessWidget {
  final List<String> rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: rows.map<Widget>((row) => KeyboardRow(row)).toList(),
      ),
    );
  }
}
