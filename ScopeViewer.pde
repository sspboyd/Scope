class ScopeViewer {
  PVector loc = new PVector(0, 0);
  int w;
  int h;



  ScopeViewer() {
  }


  void render() {
  	for (int i = 0; i<reticle.layers.length; i++){
  	pushMatrix();
  	translate(scopeViewer.w/2.0, scopeViewer.h/2.0);
  		Layer l = reticle.layers[i]; // convenience
  		image(l.limg, -l.dw/2.0, -l.dh/2.0, l.dw, l.dh);
  	popMatrix();
  	}
  }
}

