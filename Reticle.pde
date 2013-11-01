class Reticle {
  PVector loc = new PVector(0, 0);

  Layer[] layers;
  int numLayers = 4;
  PImage[] retImgs;

  Reticle() {
    layers = new Layer[numLayers];
    retImgs = new PImage[numLayers];

    // thinking of changing these from absolute values to relative values
    // The values below would become
    // (250/map.w, 250/map.h, 450/scopeViewer.w, 450/scopeViewer.h)

    Layer l3 = new Layer(250, 250, 450, 450); // (layer width, layer height, display width, display height)
    Layer l2 = new Layer(150, 150, 350, 350);
    Layer l1 = new Layer(125, 125, 225, 225);
    Layer l0 = new Layer(100, 100, 100, 100);

    layers[0] = l3; // in reverse order bc that's the order they'll be drawn on screen
    layers[1] = l2;
    layers[2] = l1;
    layers[3] = l0;

  }

	void displayRect(){
		noFill();
		stroke(0,188);
		Layer ll = layers[layers.length-1]; // ll = last layer (convenience)
		rect(loc.x-ll.lw/2, loc.y-ll.lh/2, ll.lw, ll.lh);
	}

  void update() {
		Layer fl = layers[0]; // fl = first layer (convenience)
  	int minX = int(map.loc.x + fl.dw/2);
  	int maxX = int(map.loc.x + map.w - fl.dw/2);
  	int minY = int(map.loc.y + fl.dh/2);
  	int maxY = int(map.loc.y + map.h - fl.dh/2);
    loc.x = constrain(mouseX, minX, maxX);
    loc.y = constrain(mouseY, minY, maxY);

	for (int i = 0; i<layers.length; i++){
		layers[i].update();
	}
	displayRect();
  }
}

