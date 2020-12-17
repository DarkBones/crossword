import 'package:flutter/material.dart';

class PuzzleCell extends StatelessWidget {
  final String letter;
  final double cellWidth;
  final double spacing;
  final bool isOnDownColumn;
  final bool isSolved;
  final List<int> address;

  PuzzleCell({
    @required this.letter,
    @required this.cellWidth,
    @required this.spacing,
    @required this.isOnDownColumn,
    @required this.isSolved,
    @required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleOnTap,
      child: Container(
        height: cellWidth,
        width: cellWidth,
        margin: EdgeInsets.symmetric(horizontal: spacing),
        decoration: getBoxDecoration(),
        child: Center(
          child: Text(
            getLetter(letter),
            style: getTextStyle(),
          ),
        ),
      ),
    );
  }

  void handleOnTap() {
    print('Tap on $address');
  }

  Color getColor() {
    if (isOnDownColumn) {
      return Colors.blue[200];
    }

    return Colors.white;
  }

  String getLetter(letter) {
    if (isSolved) {
      return letter;
    }

    return '_';
  }

  TextStyle getTextStyle() {
    return TextStyle(
      fontSize: cellWidth / 2,
      color: getTextColor(),
      fontWeight: FontWeight.bold,
    );
  }

  Color getTextColor() {
    if (isSolved) {
      return Colors.blue[900];
    }

    return Colors.blue[400];
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
        BoxShadow(
          blurRadius: 12.0,
          spreadRadius: -12.0,
          color: Colors.black,
        )
      ],
    );
  }
}
