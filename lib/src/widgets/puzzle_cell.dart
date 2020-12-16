import 'package:flutter/material.dart';

class PuzzleCell extends StatelessWidget {
  final String letter;
  final double cellWidth;
  final double spacing;

  PuzzleCell(
      {@required this.letter,
      @required this.cellWidth,
      @required this.spacing});

  @override
  Widget build(BuildContext context) {
    print(cellWidth);
    return Container(
      height: cellWidth,
      width: cellWidth,
      margin: EdgeInsets.symmetric(horizontal: spacing),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Center(
        child: Text(letter),
      ),
    );
  }
}
