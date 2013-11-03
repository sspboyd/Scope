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
	// (0.42, 0.42, 0.75, 0.75)

	Layer l3 = new Layer(250/800.0, 250/600.0, 450/600.0, 450/600.0); // (layer width, layer height, display width, display height)
	Layer l2 = new Layer(150/800.0, 150/600.0, 350/600.0, 350/600.0);
	Layer l1 = new Layer(125/800.0, 125/600.0, 225/600.0, 225/600.0);
	Layer l0 = new Layer(100/800.0, 100/600.0, 100/600.0, 100/600.0);

	layers[0] = l3; // in reverse order bc that's the order they'll be drawn on screen
	layers[1] = l2;
	layers[2] = l1;
	layers[3] = l0;
	}

	void displayRect(){
		noFill();
		stroke(0,188);
		Layer ll = layers[layers.length-1]; // ll = last and smallest layer (convenience)
		rect(loc.x - ll.lwPx/2, loc.y - ll.lhPx/2, ll.lwPx, ll.lhPx);
	}

  void update() {
	Layer fl = layers[0]; // fl = first and largest layer (convenience)
  	int minX = int(map.loc.x + fl.dwPx/2);
  	int maxX = int(map.loc.x + map.w - fl.dwPx/2);
  	int minY = int(map.loc.y + fl.dhPx/2);
  	int maxY = int(map.loc.y + map.h - fl.dhPx/2);
    loc.x = constrain(mouseX, minX, maxX);
    loc.y = constrain(mouseY, minY, maxY);

	for (int i = 0; i<layers.length; i++){
		layers[i].update();
	}
	displayRect();
  }
}

