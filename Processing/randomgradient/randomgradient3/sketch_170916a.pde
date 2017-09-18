color b1, b2, c1, c2;


//Blob b;
Blob[] blobs = new Blob[18];

void setup() {
  frameRate(20);
  size(1024, 1024);
  for (int i=0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
    //vaporwave palette
  int[] palette = new int[9];
  palette[0] = color(189,237,224);
  palette[1] = color(187,219,209);
  palette[2] = color(182,184,214);
  palette[3] = color(126,120,210);
  palette[4] = color(111,88,201);
  palette[5] = 0xFF52D1DC;
  palette[6] = 0xFFC0A9B0;
  palette[7] = 0xFFE6BEAE;
  palette[8] = 0xFFEFBDEB;

  //oilslick palette
  
  
  int rand = (int)random(palette.length);
  b1 = palette[rand];
  rand = (int)random(palette.length);
  b2 = palette[rand];
  rand = (int)random(palette.length);
  c1 = palette[rand];
  rand = (int)random(palette.length);
  c2 = palette[rand];
}

void draw() {
  background(51);
  
  loadPixels();
  for (int x=0; x < width; x++) {
    for (int y=0; y<height; y++) {
      int index = x+y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x,y, b.pos.x, b.pos.y);
        sum += (b.r / d)/2;

    }
            color interpolatedColor = lerpColor(c1,c2,sum);
       pixels[index] = color(interpolatedColor);
//      print(sum + " ");
    }
  }
  updatePixels();
  
  for (Blob b: blobs) {
  b.update();
  //b.show();
  }
}