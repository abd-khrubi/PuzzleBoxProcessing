class Board { //<>//

  Block blocks[];
  int size, w;

  Board(int size) {
    this.size = size;
    this.w = width / size;
    this.init();
    this.shuffle();
    //println(new AI().getNextMove(new State(this, null, -1), -1));
  }
  Board(int size, int w, Block[] blocks) {
    this.size = size;
    this.w = w;
    this.blocks = new Block[blocks.length];
    int i = 0;
    for (Block b : blocks) {
      if (b != null)
        this.blocks[i++] = b.clone();
      else
        this.blocks[i++] = null;
    }
  }
  void init() {
    this.blocks = new Block[this.size * this.size];
    int idx;
    for (idx = 0; idx < this.size * this.size - 1; ++idx) {
      this.blocks[idx] = new Block(idx, w);
    }
    this.blocks[idx] = null;
  }

  
  
  void shuffle() {
		int shuffles = boardSize * 100;
		while (shuffles-- > 0) {
			ArrayList<Block> moves = new State(this, null, -1).possibleMoves();
			this.handleClick(moves.get((int) random(moves.size())));
		}
	}

  void click(int x, int y) {
    int i = x / this.w;
    int j = y / this.w;
    int idx = j * this.size + i;
    Block block = this.blocks[idx];
    if (block != null) {
      handleClick(block);
    }
  }

  void handleClick(Block block) {
    int emptyIdx = getEmptyIdx();
    int emptyI = emptyIdx % this.size;
    int emptyJ = emptyIdx / this.size;
    if (abs(emptyI - block.i) + abs(emptyJ - block.j) == 1) { // The empty slot is next to the clicked block
      swap(emptyIdx, block.idx);
    }

    State s = new State(this, null, -1);
  }

  void swap(int idx1, int idx2) {
    Block block1 = this.blocks[idx1];
    Block block2 = this.blocks[idx2];
    this.blocks[idx1] = block2;
    this.blocks[idx2] = block1;
    if (block1 != null)
      block1.place(idx2);
    if (block2 != null)
      block2.place(idx1);
  }

  int getEmptyIdx() {
    for (int idx = 0; idx < this.blocks.length; ++idx) {
      if (this.blocks[idx] == null) {
        return idx;
      }
    }
    return -1;
  }


  Board clone() {
    //Board newBoard = new Board(this.size);
    //newBoard.blocks = new Block[this.blocks.length];
    //for (int i = 0; i < newBoard.blocks.length; ++i) {
    //  if (this.blocks[i] != null) {
    //    newBoard.blocks[i] = this.blocks[i].clone();
    //  }
    //}
    //return newBoard;
    return new Board(this.size, this.w, this.blocks);
  }

  void show() {
    background(255);
    for (Block block : this.blocks) {
      if (block != null) {
        block.show();
      }
    }
  }

  boolean equals(Object other) {
    if (other == null || !(other instanceof Board)) {
      return false;
    }
    Board o = (Board)other;
    for (int idx = 0; idx < this.blocks.length; ++idx) {
      if (this.blocks[idx] != null) {
        if (!this.blocks[idx].equals( o.blocks[idx])) {
          return false;
        }
      }
    }
    return true;
  }
  
  String toString() {
   return this.blocks.toString(); 
  }
}
