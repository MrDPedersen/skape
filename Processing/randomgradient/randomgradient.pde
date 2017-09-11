int Y_AXIS = 1;
int X_AXIS = 2;
int ELIPSE = 0;
color b1, b2, c1, c2;
int dim;
int file;

void setup() {
  size(1024, 1024);
  int[] palette = new int[10];
  palette[0] = color(189,237,224);
  palette[1] = color(187,219,209);
  palette[2] = color(182,184,214);
  palette[3] = color(126,120,210);
  palette[4] = color(111,88,201);
  palette[5] = 0xFF52D1DC;
  palette[6] = 0xFFC0A9B0;
  palette[7] = 0xFFE6BEAE;
  palette[8] = 0xFF444545;
  palette[9] = 0xFFEFBDEB;
  
  int rand = (int)random(palette.length);
  b1 = palette[rand];
  rand = (int)random(palette.length);
  b2 = palette[rand];
  rand = (int)random(palette.length);
  c1 = palette[rand];
  rand = (int)random(palette.length);
  c2 = palette[rand];
  
  noStroke();
  ellipseMode(RADIUS);
  dim = width/2;


  noLoop();
}

void draw() {
  // Background
  setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
  setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
  // Foreground
  setGradient(50, 90, 540, 80, c1, c2, Y_AXIS);
  setGradient(50, 190, 540, 80, c2, c1, X_AXIS);
  for (int x = 0; x <= width; x+=dim) {
   drawGradient(x, height/2);
  } 
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 500, 500);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}
void mouseClicked() {
  file = floor(random(1000));
  saveFrame("tex-" + file + ".png");
  print("Saved!");
  reset();
}
void reset() {
  setup();
}