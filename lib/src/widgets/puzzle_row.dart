import 'package:crossword/src/models/puzzle_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './puzzle_cell.dart';

class PuzzleRow extends StatelessWidget {
  final int rowIndex;
  final double bMargin;
  final double spacing;

  PuzzleRow({
    @required this.rowIndex,
    @required this.bMargin,
    @required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final PuzzleModel puzzle = Provider.of<Map>(context)['puzzle'];

    final Map<String, dynamic> row = puzzle.across[rowIndex];
    int column = 0;

    return Container(
      margin: EdgeInsets.only(bottom: bMargin),
      child: Row(
        children: row['answer'].split('').map<Widget>((String ch) {
          PuzzleCell cell = PuzzleCell(
            spacing: spacing,
            address: [rowIndex, column],
          );

          column++;
          return cell;
        }).toList(),
      ),
    );
  }
}
