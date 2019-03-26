Board board;

int boardSize = 10;

void setup() {
  size(800, 800);
  board = new Board(boardSize);
  board.show();
}
void mousePressed() {
  board.click(mouseX, mouseY);
}

void keyPressed() {
 if (key == 'r' || key == 'R') {
   board.shuffle();
 }
}
void draw() {
  board.show();
}  
