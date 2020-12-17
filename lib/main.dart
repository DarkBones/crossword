import 'package:flutter/material.dart';
import 'src/puzzle.dart';

void main() => runApp(CrosswordApp());

class CrosswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle App',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehaviorXtd(),
          child: child,
        );
      },
      home: Puzzle(),
    );
  }
}

class ScrollBehaviorXtd extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
