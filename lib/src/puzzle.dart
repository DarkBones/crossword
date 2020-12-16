import 'dart:convert';

import 'package:flutter/material.dart';

import './models/puzzle_model.dart';
import './widgets/puzzle_grid.dart';

class Puzzle extends StatefulWidget {
  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  PuzzleModel puzzle;

  @override
  Widget build(BuildContext context) {
    puzzle = buildPuzzleModel();

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            new PuzzleGrid(buildPuzzleModel()),
          ],
        ),
      ),
    );
  }

  PuzzleModel buildPuzzleModel() {
    String data =
        '{"across": [{"answer": "TENT", "clue": "clue: tent"},{"answer": "EARN", "clue": "clue: earn"},{"answer": "NEST", "clue": "clue: nest"},{"answer": "ARTS", "clue": "clue: arts"},{"answer": "NERD", "clue": "clue: nerd"},{"answer": "TOLL", "clue": "clue: toll"}],"down": {"answer": "TENANT", "clue": "clue: tenant"}, "down_column": 0, "height": 6, "width": 4}';
    return new PuzzleModel(jsonDecode(data));
  }
}
