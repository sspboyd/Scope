class Layer {

  PVector loc = new PVector(0, 0);
  float lw, lh;
  float dw, dh;
  int lwPx, lhPx;
  int dwPx, dhPx;
  PImage limg; //the image captured by the layer;

  Layer(float _lw, float _lh, float _dw, float _dh) {
    lw = _lw; // layer width (0.0 to 1.0 range)
    lh = _lh;
    dw = _dw; // display layer width (0.0 to 1.0 range)
    dh = _dh;

    lwPx = int(lw * map.w); // convert above ranges to pixel values based on size of map / scopeViewer sizes
    lhPx = int(lh * map.h);
    dwPx = int(dw * scopeViewer.w);
    dhPx = int(dh * scopeViewer.h);

    println(lw + ", "+lh + ", "+dw + ", "+dh);
    println(lwPx + ", "+lhPx + ", "+dwPx + ", "+dhPx);
  }

  void update(){
  	loc.x = reticle.loc.x - lwPx/2;
  	loc.y = reticle.loc.y - lhPx/2;
  	limg = captureImg();
  }

  PImage captureImg() {
    PImage cap;
    PImage mi = map.mimg; // just for convenience

    float imgX = ((loc.x-map.loc.x)/map.w)*mi.width;
    float imgY = ((loc.y-map.loc.y)/map.h)*mi.height;
    float capW = lw * mi.width;
    float capY = lh * mi.height;

    cap = mi.get(int(imgX), int(imgY), int(capW), int(capY));
    return cap;
  }
}

