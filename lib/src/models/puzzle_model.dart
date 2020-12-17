class PuzzleModel {
  List<dynamic> across;
  Map<String, dynamic> down;
  int downColumn;
  int height;
  int width;
  List<List<bool>> solved;

  PuzzleModel(parsedJson) {
    across = parsedJson['across'];
    down = parsedJson['down'];
    downColumn = parsedJson['down_column'];
    height = parsedJson['height'];
    width = parsedJson['width'];

    solved = List.generate(
        height, (i) => List.generate(width, (j) => false, growable: false),
        growable: false);
  }

  void solve({int row, int col}) {
    solved[row][col] = true;
  }

  bool isCellSolved(List<int> address) {
    return solved[address[0]][address[1]];
  }

  String letterAtAddress(List<int> address) {
    return across[address[0]][address[1]];
  }
}
