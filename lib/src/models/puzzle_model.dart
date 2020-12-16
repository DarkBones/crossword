class PuzzleModel {
  List<dynamic> across;
  Map<String, dynamic> down;
  int downColumn;
  int height;
  int width;

  PuzzleModel(parsedJson) {
    across = parsedJson['across'];
    down = parsedJson['down'];
    downColumn = parsedJson['down_column'];
    height = parsedJson['height'];
    width = parsedJson['width'];
  }
}
