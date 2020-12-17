import 'package:collection/collection.dart';
import 'package:crossword/src/models/puzzle_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleCell extends StatelessWidget {
  final double cellWidth;
  final double spacing;
  final List<int> address;

  PuzzleCell({
    @required this.cellWidth,
    @required this.spacing,
    @required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final Map ctx = Provider.of<Map>(context, listen: false);
    final PuzzleModel puzzle = ctx['puzzle'];

    final isSolved = puzzle.isCellSolved(address);
    final bool isSelected = ListEquality().equals(
      address,
      ctx['selectedCell'],
    );

    final bool isRowSelected = !isSelected &&
        address[0] == Provider.of<Map>(context)['selectedCell'][0];

    final String letter = puzzle.letterAtAddress(address);
    final bool isOnDownColumn = puzzle.downColumn == address[1];

    return GestureDetector(
      // onTap: () => Provider.of<Map>(context)['selectCell']([0, 0]),
      onTap: () => ctx['selectCell'](address),
      child: Container(
        height: cellWidth,
        width: cellWidth,
        margin: EdgeInsets.symmetric(horizontal: spacing),
        decoration: getBoxDecoration(isSelected, isRowSelected, isOnDownColumn),
        child: Center(
          child: Text(
            getLetter(letter, isSolved),
            style: getTextStyle(isSolved),
          ),
        ),
      ),
    );
  }

  Color getColor(isSelected, isRowSelected, isOnDownColumn) {
    if (isOnDownColumn) {
      if (isRowSelected) {
        return Colors.yellow[300];
      }

      if (isSelected) {
        return Colors.yellow[600];
      }
      return Colors.blue[200];
    }

    if (isRowSelected) {
      return Colors.yellow[200];
    }

    if (isSelected) {
      return Colors.yellow[500];
    }
    return Colors.white;
  }

  String getLetter(letter, isSolved) {
    if (isSolved) {
      return letter;
    }

    return '_';
  }

  TextStyle getTextStyle(isSolved) {
    return TextStyle(
      fontSize: cellWidth / 2,
      color: getTextColor(isSolved),
      fontWeight: FontWeight.bold,
    );
  }

  Color getTextColor(isSolved) {
    if (isSolved) {
      return Colors.blue[900];
    }

    return Colors.blue[400];
  }

  BoxDecoration getBoxDecoration(isSelected, isRowSelected, isOnDownColumn) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      color: getColor(isSelected, isRowSelected, isOnDownColumn),
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
