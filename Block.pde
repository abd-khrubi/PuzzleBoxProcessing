class Block {
  int num, idx, i, j, x, y, w;

  Block(int idx, int w) {
    this.idx = idx;
    this.num = idx + 1;
    this.w = w;
    this.place(idx);
  }
  
  void place(int idx){
    this.idx = idx;
    this.i = idx % boardSize;
    this.j = idx / boardSize;
    this.x = this.i * this.w;
    this.y = this.j * this.w;
  }

  void show() {
    fill(225, 225, 225);
    square(x, y, w);
    stroke(0);
    strokeWeight(2);  
    noFill();
    square(x, y, w);
    fill(0);
    textSize(16);
    text(Integer.toString(this.num), this.x + this.w/2 - 4, this.y + this.w/2 + 4);
  }
  Block clone() {
    Block b = new Block(this.idx, this.w);
    b.num = this.num;
    return b;
  }
  String toString() {
   return new StringBuilder("[").append(this.idx).append("] ").append(this.i).append(", ").append(this.j).append(" (").append(this.num).append(")").toString();  
  }
  
  boolean equals(Object other) {
   if (other == null || !(other instanceof Block)) {
     return false;
   }
   return ((Block)other).num == this.num;
  }
}
