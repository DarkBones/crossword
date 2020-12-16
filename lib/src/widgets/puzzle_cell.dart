import 'package:flutter/material.dart';

class PuzzleCell extends StatelessWidget {
  final String letter;
  final double cellWidth;
  final double spacing;
  final bool isOnDownColumn;

  PuzzleCell(
      {@required this.letter,
      @required this.cellWidth,
      @required this.spacing,
      @required this.isOnDownColumn});

  @override
  Widget build(BuildContext context) {
    print(cellWidth);
    return Container(
      height: cellWidth,
      width: cellWidth,
      margin: EdgeInsets.symmetric(horizontal: spacing),
      decoration: getBoxDecoration(),
      child: Center(
        child: Text(
          letter,
          style: getTextStyle(),
        ),
      ),
    );
  }

  Color getColor() {
    if (isOnDownColumn) {
      return Colors.red[300];
    }
    return Colors.blue[500];
  }

  TextStyle getTextStyle() {
    return TextStyle(
      fontSize: cellWidth / 2,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      color: getColor(),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(3, 3),
        ),
      ],
    );
  }
}
