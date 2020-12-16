import 'package:flutter/material.dart';

import './puzzle_cell.dart';

class PuzzleRow extends StatelessWidget {
  final Map<String, dynamic> row;

  PuzzleRow(this.row);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: row['answer']
          .split('')
          .map<Widget>((String ch) => PuzzleCell(
                letter: ch,
                letterCount: row['answer'].length,
              ))
          .toList(),
    );
  }

  // List<T> buildRow() {
  //   return row['answer'].split('').map((String ch) {
  //     return Text(ch);
  //   });

  //   return [Text('C'), Text('D')];
  // }
}
