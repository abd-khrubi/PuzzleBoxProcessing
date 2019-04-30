class Helper extends PApplet {

  int w, h;
  PImage img;
  public Helper(PImage img, int w, int h) {
    this.w = w;
    this.h = h;
    this.img = img;
    this.img.resize(w, h);
  }

  public void settings() {
    super.size(w, h);
  }

  public void setup() {

    super.image(img, 0, 0);
  }

  public void draw() {
  }
}
