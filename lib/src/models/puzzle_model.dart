class PuzzleModel {
  List<dynamic> across;
  Map<String, dynamic> down;
  int downColumn;
  int height;
  int width;
  Map<int, List<int>> unsolved;

  PuzzleModel(parsedJson) {
    across = parsedJson['across'];
    down = parsedJson['down'];
    downColumn = parsedJson['down_column'];
    height = parsedJson['height'];
    width = parsedJson['width'];

    unsolved = new Map<int, List<int>>();
    for (int row = 0; row < height; row++) {
      unsolved[row] = List<int>.generate(width, (i) => i);
    }
  }

  void solve(List<int> address) {
    unsolved[address[0]].remove(address[1]);
    if (unsolved[address[0]].length == 0) {
      unsolved.remove(address[0]);
    }
  }

  bool isCellSolved(List<int> address) {
    return !unsolved[address[0]].contains(address[1]);
  }

  String letterAtAddress(List<int> address) {
    return across[address[0]]['answer'][address[1]];
  }

  List<int> firstUnsolved() {
    int row = unsolved.keys.toList()[0];
    int col = unsolved[row][0];

    return [row, col];
  }

  List<int> nextUnsolved(List<int> address) {
    List<int> keys = unsolved.keys.toList();

    int row = address[0];
    int col = address[1];

    int rowIdx = keys.indexOf(row);
    int colIdx = unsolved[row].indexOf(col) + 1;

    if (colIdx == unsolved[keys[rowIdx]].length) {
      rowIdx = (rowIdx + 1) % keys.length;

      row = keys[rowIdx];
      col = unsolved[keys[rowIdx]][0];
    } else {
      col = unsolved[rowIdx][colIdx];
    }

    return [row, col];
  }
}
