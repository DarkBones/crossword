import 'package:flutter/material.dart';
import 'puzzle/puzzle.dart';

void main() => runApp(CrosswordApp());

class CrosswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle App',
      home: Puzzle(),
    );
  }
}
