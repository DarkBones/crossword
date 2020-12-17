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
    return Container(
      color: Colors.blue[900],
      margin: EdgeInsets.only(top: tMargin),
      padding: EdgeInsets.only(left: hMargin, right: hMargin),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 250,
        child: ListView.builder(
          padding: EdgeInsets.only(top: rowSpacing),
          itemCount: puzzle.across.length,
          itemBuilder: (context, int index) {
            return new PuzzleRow(
              row: puzzle.across[index],
              rowIndex: index,
              bMargin: rowSpacing,
              spacing: spacing,
              downColumn: puzzle.downColumn,
              solved: puzzle.solved[index],
            );
          },
        ),
      ),
    );
  }
}
