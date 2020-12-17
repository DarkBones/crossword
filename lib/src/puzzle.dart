import 'dart:convert';

import 'package:crossword/src/widgets/keyboard/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/puzzle_model.dart';
import 'widgets/puzzle_grid/puzzle_grid.dart';

class Puzzle extends StatefulWidget {
  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  PuzzleModel puzzle;
  List<int> selected = [-1, -1];
  final Map<String, dynamic> puzzleStyle = {
    'mx': 25.0,
    'mt': 70.0,
    'cellSpacing': 5.0,
    'rowSpacing': 15.0
  };

  @override
  Widget build(BuildContext context) {
    puzzle = buildPuzzleModel();

    puzzle.solve(row: 0, col: 0);
    puzzle.solve(row: 0, col: 1);
    puzzle.solve(row: 0, col: 3);
    puzzle.solve(row: 1, col: 1);

    if (selected[0] < 0) {
      selectCell(firstUnsolved());
    }

    // selectNextUnsolved([0, 0]);
    Map ctx = {
      'cellWidth': calcCellWidth(context),
      'selectCell': selectCell,
      'selectedCell': selected,
      'puzzle': puzzle,
    };

    return Provider<Map>.value(
      value: ctx,
      child: Scaffold(
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new PuzzleGrid(puzzle),
              new Keyboard(),
            ],
          ),
        ),
      ),
    );
  }

  PuzzleModel buildPuzzleModel() {
    String data =
        '{"across": [{"answer": "TENT", "clue": "clue: tent"},{"answer": "EARN", "clue": "clue: earn"},{"answer": "NEST", "clue": "clue: nest"},{"answer": "ARTS", "clue": "clue: arts"},{"answer": "NERD", "clue": "clue: nerd"},{"answer": "TOLL", "clue": "clue: toll"}],"down": {"answer": "TENANT", "clue": "clue: tenant"}, "down_column": 0, "height": 6, "width": 4}';
    return new PuzzleModel(jsonDecode(data));
  }

  List<int> firstUnsolved() {
    for (int row = 0; row < puzzle.height; row++) {
      for (int col = 0; col < puzzle.width; col++) {
        if (!puzzle.solved[row][col]) {
          return [row, col];
        }
      }
    }

    return [-1, -1];
  }

  void selectNextUnsolved(address) {
    bool found = false;

    for (int row = address[0]; row < puzzle.height; row++) {
      for (int col = address[1]; col < puzzle.width; col++) {
        if (!puzzle.solved[row][col]) {
          found = true;
          selectCell([row, col]);
          break;
        }
      }

      if (found) {
        break;
      }
    }
  }

  void selectCell(address) {
    if (puzzle.isCellSolved(address)) {
      return;
    }

    setState(() {
      selected = address;
    });
  }

  double calcCellWidth(context) {
    double width = MediaQuery.of(context).size.width;
    width -= (puzzleStyle['mx'] * 2);

    width -= puzzle.width * (puzzleStyle['cellSpacing'] * 2);

    width /= puzzle.width;

    return width;
  }
}
