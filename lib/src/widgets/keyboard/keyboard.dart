import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './keyboard_row.dart';

class Keyboard extends StatelessWidget {
  final List<String> _rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'];
  final Map<String, dynamic> keyboardStyle = {
    'mx': 0.5,
    'mt': 10.0,
    'keyHeight': 50.0,
    'keySpacing': 1.0,
  };

  @override
  Widget build(BuildContext context) {
    final Map keyboardContext = {
      'keySpacing': keyboardStyle['keySpacing'],
      'keyWidth': calcKeyWidth(context),
      'keyHeight': keyboardStyle['keyHeight'],
      'selectNextCell': Provider.of<Map>(context)['selectNextCell'],
    };

    return Provider<Map>.value(
      value: keyboardContext,
      child: Container(
        color: Colors.blue[800],
        padding: EdgeInsets.only(
          left: keyboardStyle['mx'],
          right: keyboardStyle['mx'],
          top: keyboardStyle['mt'],
        ),
        child: Column(
          children: _rows.map<Widget>((row) => KeyboardRow(row)).toList(),
        ),
      ),
    );
  }

  double calcKeyWidth(context) {
    int maxRowLength = 10;

    double width = MediaQuery.of(context).size.width;
    width -= (keyboardStyle['mx'] * 2);
    width -= maxRowLength * (keyboardStyle['keySpacing'] * 2);
    width /= maxRowLength;

    return width;
  }
}
