import 'package:flutter/material.dart';

class PuzzleCell extends StatelessWidget {
  final String letter;
  final int letterCount;

  PuzzleCell({this.letter, this.letterCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(letter),
    );
  }
}
