import 'package:flutter/material.dart';
import './keyboard_row.dart';

class Keyboard extends StatelessWidget {
  final List<String> _rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _rows.map<Widget>((row) => KeyboardRow(row)).toList(),
      ),
    );
  }
}
