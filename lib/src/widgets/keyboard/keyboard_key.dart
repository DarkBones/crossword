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
  bool isPressed = false;

  _KeyboardKeyState(this.letter);

  @override
  Widget build(BuildContext context) {
    final Map keyboardContext = Provider.of<Map>(context);
    final double keyWidth = keyboardContext['keyWidth'];
    final double keySpacing = keyboardContext['keySpacing'];
    final double keyHeight = keyboardContext['keyHeight'];

    return GestureDetector(
      onTapDown: _handleOnTapDown,
      onTapUp: _handleOnTapUp,
      onTapCancel: _handleOnTapCancel,
      child: Container(
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
      ),
    );
  }

  Color _getColor() {
    if (isPressed) {
      return Colors.yellow;
    }

    return Colors.blue[900];
  }

  void _handleOnTapDown(TapDownDetails e) {
    setState(() {
      isPressed = true;
    });
  }

  void _handleOnTapUp(TapUpDetails e) {
    setState(() {
      isPressed = false;
    });
  }

  void _handleOnTapCancel() {
    setState(() {
      isPressed = false;
    });
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: _getColor(),
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
