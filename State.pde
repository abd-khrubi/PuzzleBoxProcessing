
class State {
  private Board board;
  State lastState;
  int move;
  State(Board board, State lState, int move) {
    this.board = board.clone();
    this.lastState = lState;
    this.move = move;
  }

  int getHue() {
    int h1 = 0, h2 = 0;
    for (int idx = 0; idx < this.board.blocks.length; ++idx) {
      Block block = this.board.blocks[idx];
      if (block != null && block.idx != block.num - 1) {
        ++h1;
      } else if (block == null && idx != 8) {
        ++h1;
      }
    }
    for (int idx = 0; idx < this.board.blocks.length; ++idx) {
      Block block = this.board.blocks[idx];
      int i1 = idx % this.board.size;
      int j1 = idx / this.board.size;
      int i2, j2;
      if (block != null) {
        i2 = (block.num - 1) % this.board.size;
        j2 = (block.num - 1) / this.board.size;
      } else {
        i2 = 2;
        j2 = 2;
      }
      h2 += MD(i1, j1, i2, j2);
      this.board.show();
    }

    return h1 + h2;
  }

  ArrayList<Block> possibleMoves() {
    ArrayList<Block> moves = new ArrayList<Block>();
    int emptyIdx = this.board.getEmptyIdx();
    int emptyI = emptyIdx % this.board.size;
    int emptyJ = emptyIdx / this.board.size;

    for (int j = -1; j < 2; ++j) {
      for (int i = -1; i < 2; ++i) {
        if (abs(i) != abs(j)) {
          int ii = i + emptyI;
          int jj = j + emptyJ;
          if (ii >= 0 && ii < this.board.size && jj >= 0 && jj < this.board.size) {
            int idx = jj * this.board.size + ii;
            moves.add(this.board.blocks[idx]);
          }
        }
      }
    }
    return moves;
  }

  int MD(int i1, int j1, int i2, int j2) {
    return abs(i1 - i2) + abs(j1 - j2);
  }

  boolean equals(Object other) {
    if (other == null || !(other instanceof State)) {
      return false;
    }
    return this.board.equals(((State)other).board);
  }
  String toString() {
   return super.toString() + " [" + this.getHue() + "]";
  }
}
