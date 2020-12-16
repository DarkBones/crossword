import 'package:crossword/src/puzzle.dart';
import 'package:flutter/material.dart';
import '../models/puzzle_model.dart';

class PuzzleGrid extends StatelessWidget {
  final PuzzleModel puzzle;

  PuzzleGrid(this.puzzle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello'),
    );
  }
}
