class Layer {

  PVector loc = new PVector(0, 0);
  float lw, lh;
  float dw, dh;
  PImage limg; //the image captured by the layer;

  Layer(float _lw, float _lh, float _dw, float _dh) {
    lw = _lw;
    lh = _lh;
    dw = _dw;
    dh = _dh;
  }

void update(){
	loc.x = reticle.loc.x - lw/2;
	loc.y = reticle.loc.y - lh/2;
limg = captureImg();

}

  PImage captureImg() {
    PImage cap;
    PImage mi = map.mimg; // just for convenience

    float imgX = ((loc.x-map.loc.x)/map.w)*mi.width;
    float imgY = ((loc.y-map.loc.y)/map.h)*mi.height;
    float capW = (lw/map.w)*mi.width;
    float capY = (lh/map.h)*mi.height;

	//println(imgX+", "+imgY+", "+capW+", "+capY);
	cap = mi.get(int(imgX), int(imgY), int(capW), int(capY));
    return cap;
  }
}

