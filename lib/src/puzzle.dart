import 'dart:convert';

import 'package:flutter/material.dart';

import './models/puzzle_model.dart';

class Puzzle extends StatefulWidget {
  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  final String jsonData =
      '{"across": [{"answer": "TENT", "clue": "clue: tent"},{"answer": "EARN", "clue": "clue: earn"},{"answer": "NEST", "clue": "clue: nest"},{"answer": "ARTS", "clue": "clue: arts"},{"answer": "NERD", "clue": "clue: nerd"},{"answer": "TOLL", "clue": "clue: toll"}],"down": {"answer": "TENANT", "clue": "clue: tenant"}, "down_column": 0, "height": 6, "width": 4}';

  PuzzleModel puzzleModel;

  _PuzzleState() {
    puzzleModel = new PuzzleModel.fromJson(jsonDecode(jsonData));
  }

  @override
  Widget build(BuildContext context) {
    print(puzzleModel.across[0]['clue']);

    return Scaffold(
      body: Center(
        child: Text('Hello there!'),
      ),
    );
  }
}
