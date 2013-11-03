class ScopeViewer {
  int w;
  int h;
  PVector loc;



  ScopeViewer() {
//  loc = new PVector(scopeViewer.w/2.0, scopeViewer.h/2.0); // used if I want to pin the scopeViewer in place
  loc = new PVector(0,0);
    w = map.h;
    h = map.h;
}

void update(){
//  loc = new PVector(scopeViewer.w/2.0, scopeViewer.h/2.0); // used if I want to pin the scopeViewer in place
	loc.x = reticle.loc.x;
	loc.y = reticle.loc.y;
}

  void render() {
  	for (int i = 0; i<reticle.layers.length; i++){
	  	pushMatrix();
		  	translate(loc.x, loc.y);
		  	// translate(scopeViewer.w/2.0, scopeViewer.h/2.0);
	  		Layer l = reticle.layers[i]; // convenience
	  		image(l.limg, -l.dwPx/2.0, -l.dhPx/2.0, l.dwPx, l.dhPx);
	  	popMatrix();
  	}
  }
}

