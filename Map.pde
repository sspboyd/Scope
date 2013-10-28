class Map {
  PVector loc = new PVector(0, 0);
  
  // PImage mimg = loadImage("5353082400_4da77da906_b.jpg");
   PImage mimg = loadImage("6870606269_d3b60a1879_o.jpg");
  // PImage mimg = loadImage("4909065075_33e4cde655_b.jpg");
  int w = 800;
  int h = 600;


  Map() {
  }

  void render() {
    image(mimg, loc.x, loc.y, w, h);
  }
}

