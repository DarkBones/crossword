import 'package:flutter/material.dart';
import 'puzzle_row.dart';

class Puzzle extends StatefulWidget {
  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  final Map<String, dynamic> data = {
    'across': [
      {
        'answer': 'TENT',
        'clue': 'clue: tent',
      },
      {
        'answer': 'EARN',
        'clue': 'clue: earn',
      },
      {
        'answer': 'NEST',
        'clue': 'clue: nest',
      },
      {
        'answer': 'ARTS',
        'clue': 'clue: arts',
      },
      {
        'answer': 'NERD',
        'clue': 'clue: nerd',
      },
      {
        'answer': 'TOLL',
        'clue': 'clue: toll',
      },
    ],
    'down': {
      'answer': 'TENANT',
      'clue': 'clue: tenant',
    },
    'down_column': 0,
    'height': 6,
    'width': 4,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data['across'][0].toString()),
      ),
    );
  }
}
