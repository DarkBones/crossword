import 'package:crossword/src/puzzle.dart';
import 'package:flutter/material.dart';
import '../models/puzzle_model.dart';
import './puzzle_row.dart';

class PuzzleGrid extends StatelessWidget {
  final PuzzleModel puzzle;

  PuzzleGrid(this.puzzle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: ListView.builder(
        itemCount: puzzle.across.length,
        itemBuilder: (context, int index) {
          return new PuzzleRow(puzzle.across[index]);
        },
      ),
    );
  }
}
