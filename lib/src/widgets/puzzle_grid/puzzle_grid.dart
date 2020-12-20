import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../models/puzzle_model.dart';
import 'puzzle_row.dart';

class PuzzleGrid extends StatelessWidget {
  final PuzzleModel puzzle;
  final double hMargin = 25.0;
  final double tMargin = 70.0;
  final double spacing = 5.0;
  final double rowSpacing = 15.0;
  final AutoScrollController scrollController;

  PuzzleGrid(this.puzzle, this.scrollController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      margin: EdgeInsets.only(top: tMargin),
      padding: EdgeInsets.only(left: hMargin, right: hMargin),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 250,
        child: ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.only(top: rowSpacing),
          itemCount: puzzle.across.length,
          itemBuilder: (context, int index) {
            return AutoScrollTag(
              key: ValueKey(index),
              controller: scrollController,
              index: index,
              child: new PuzzleRow(
                rowIndex: index,
                bMargin: rowSpacing,
                spacing: spacing,
              ),
            );
          },
        ),
      ),
    );
  }
}
