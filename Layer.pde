class Layer {
  PVector loc = new PVector(0, 0);
  float lw, lh; // base layer width/height
  float dw, dh; // base display width/height
  float clw, clh; // current layer width/height
  float cdw, cdh; // current display width/height
  int lwPx, lhPx; // layer width/height in pixels
  int dwPx, dhPx; // display width/height in pixels
  PImage limg; //the image captured by the layer;

  Layer(float _lw, float _lh, float _dw, float _dh) {
    lw = _lw; // base layer width (0.0 to 1.0 range)
    lh = _lh;
    dw = _dw; // base display layer width (0.0 to 1.0 range)
    dh = _dh;
  }

  void update(){
    clw = lw * reticle.rScale; // calculate the current w/h for layers and display info
    clh = lh * reticle.rScale;
    cdw = dw * reticle.rScale;
    cdh = dh * reticle.rScale;

    lwPx = int(clw * map.w); // convert above ranges to pixel values based on size of map / scopeViewer sizes
    lhPx = int(clh * map.h);
    dwPx = int(cdw * scopeViewer.w);
    dhPx = int(cdh * scopeViewer.h);

  	loc.x = reticle.loc.x - lwPx/2; // set the reticle x/y location
  	loc.y = reticle.loc.y - lhPx/2;

  	limg = captureImg(); // fire the image capture method
  }

  PImage captureImg() {
    PImage cap;
    PImage mi = map.mimg; // just for convenience

    float imgX = ((loc.x - map.loc.x) / map.w) * mi.width;
    float imgY = ((loc.y - map.loc.y) / map.h) * mi.height;
    float capW = clw * mi.width;
    float capY = clh * mi.height;

    cap = mi.get(int(imgX), int(imgY), int(capW), int(capY));
    return cap;
  }
}