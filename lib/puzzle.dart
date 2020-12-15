import 'package:flutter/material.dart';

class Puzzle extends StatefulWidget {
  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('puzzle page'),
      ),
    );
  }
}
