import 'package:flutter/material.dart';

class PuzzleRow extends StatelessWidget {
  final String answer;
  final String clue;

  const PuzzleRow({Key key, this.answer, this.clue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(answer),
    );
  }
}

class PuzzleRowModel {
  String answer;
  String clue;

  PuzzleRowModel({this.answer, this.clue});

  PuzzleRowModel.fromJson(parsedJson) {
    answer = parsedJson['answer'];
    clue = parsedJson['clue'];
  }
}
