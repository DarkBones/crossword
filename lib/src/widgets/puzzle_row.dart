import 'package:flutter/material.dart';

import './puzzle_cell.dart';

class PuzzleRow extends StatelessWidget {
  final Map<String, dynamic> row;
  final double hMargin;
  final double bMargin;
  final double spacing;
  final double cellWidth;
  final int downColumn;

  PuzzleRow(
      {@required this.row,
      @required this.hMargin,
      @required this.bMargin,
      @required this.spacing,
      @required this.cellWidth,
      @required this.downColumn});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Container(
      margin: EdgeInsets.only(left: hMargin, right: hMargin, bottom: bMargin),
      child: Row(
        children: row['answer'].split('').map<Widget>((String ch) {
          return PuzzleCell(
              letter: ch,
              cellWidth: cellWidth,
              spacing: spacing,
              isOnDownColumn: (index++) == downColumn);
        }).toList(),
      ),
    );
  }
}
