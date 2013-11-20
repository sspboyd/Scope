class Map {
  PVector loc = new PVector(0, 0);
  
  PImage mimg = loadImage("5353082400_4da77da906_b.jpg");
  // PImage mimg = loadImage("6870606269_d3b60a1879_o.jpg");
  // PImage mimg = loadImage("4909065075_33e4cde655_b.jpg");
  // PImage mimg = loadImage("IMG00217-20110105-1634.jpg");

  int w = mimg.width;
  int h = mimg.height;

  Map() {
    mimg.resize(w,h);
  }

  void render() {
    image(mimg, loc.x, loc.y, w, h);
  }
}