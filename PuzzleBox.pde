Board board;

int boardSize = 4;

String imagePath = "./apple.jpg";
void settings() {
 size(800, 800); 
}
void setup() {
  board = new Board(boardSize);
  
  String[] args = new String[] {"Helper"};
  Helper helper = new Helper(loadImage(imagePath), 400, 400);
  PApplet.runSketch(args,helper);
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

PImage[] processImage(String path) {
  int size = boardSize * boardSize;
  int blockwidth = width / boardSize;

  PImage[] result = new PImage[size];

  PImage img = loadImage(path);
  img.resize(width, height);
  for (int j = 0; j < boardSize; ++j) {
    for (int  i = 0; i < boardSize; ++i) {
      int idx = j * boardSize + i;
      result[idx] = img.get(i * blockwidth, j * blockwidth, blockwidth, blockwidth);
    }
  }
  return result;
}
