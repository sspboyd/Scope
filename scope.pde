//Declare Globals
int rSn; // randomSeed number. put into var so can be saved in file name. defaults to 47
final float PHI = 0.618033989;
PFont font;

Map map;
Reticle reticle;
ScopeViewer scopeViewer;

void setup() {
  background(255);
  size(800, 600);

  map = new Map();
  reticle = new Reticle();
  scopeViewer = new ScopeViewer();
}

void draw() {
  background(0);
  map.render();
  reticle.update();
  scopeViewer.update();
  scopeViewer.render();

}





// UI
void keyPressed() {
  if (key == 'S') screenCap();
}

void screenCap() {
  // save functionality in here
  String outputDir = "out/";
  String sketchName = getSketchName() + "-";
  String randomSeedNum = "rS" + rSn + "-";
  String dateTimeStamp = "" + year() + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  String fileType = ".tif";
  String fileName = outputDir + sketchName + randomSeedNum + dateTimeStamp + fileType;
  save(fileName);
  println("Screen shot taken and saved to " + fileName);
}

String getSketchName() {
  String[] path = split(sketchPath, "/");
  return path[path.length-1];
}