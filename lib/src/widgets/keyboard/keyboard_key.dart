import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeyboardKey extends StatefulWidget {
  final String letter;

  KeyboardKey(this.letter);

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState(letter);
}

class _KeyboardKeyState extends State<KeyboardKey> {
  final String letter;

  _KeyboardKeyState(this.letter);

  @override
  Widget build(BuildContext context) {
    final Map keyboardContext = Provider.of<Map>(context);
    final double keyWidth = keyboardContext['keyWidth'];
    print(keyWidth);
    final double keySpacing = keyboardContext['keySpacing'];
    final double keyHeight = keyboardContext['keyHeight'];

    return Container(
      height: keyHeight,
      width: keyWidth,
      margin: EdgeInsets.all(keySpacing),
      decoration: _getBoxDecoration(),
      child: Center(
        child: Text(
          letter,
          style: _getTextStyle(),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: Colors.blue[900],
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      color: Colors.white,
    );
  }
}
