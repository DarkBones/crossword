import 'package:crossword/src/puzzle.dart';
import 'package:flutter/material.dart';
import '../models/puzzle_model.dart';
import './puzzle_row.dart';

class PuzzleGrid extends StatelessWidget {
  final PuzzleModel puzzle;
  final double hMargin = 25.0;
  final double tMargin = 70.0;
  final double spacing = 5.0;
  final double rowSpacing = 15.0;

  PuzzleGrid(this.puzzle);

  @override
  Widget build(BuildContext context) {
    puzzle.solve(row: 0, col: 0);
    puzzle.solve(row: 0, col: 1);
    puzzle.solve(row: 0, col: 3);
    puzzle.solve(row: 1, col: 1);

    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: Padding(
        padding: EdgeInsets.only(top: tMargin),
        child: ListView.builder(
          padding: EdgeInsets.only(top: rowSpacing),
          itemCount: puzzle.across.length,
          itemBuilder: (context, int index) {
            return new PuzzleRow(
              row: puzzle.across[index],
              hMargin: hMargin,
              bMargin: rowSpacing,
              spacing: spacing,
              cellWidth: calcCellWidth(context),
              downColumn: puzzle.downColumn,
              solved: puzzle.solved[index],
            );
          },
        ),
      ),
    );
  }

  double calcCellWidth(context) {
    double width = MediaQuery.of(context).size.width;
    width -= (hMargin * 2);

    width -= puzzle.width * (spacing * 2);

    width /= puzzle.width;

    return width;
  }
}
