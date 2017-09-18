color b1, b2, c1, c2;

float buttonx = 1044;
float buttonwidth = 256;
float buttonh = 32;

float resety = 42;
float savey = 82;
float swapy = 122;


void setup() {
  size(1280, 1024);
  //toolbar is 256px wide
  
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

noStroke();

}

void draw() {
textSize(buttonh);
fill(0);
text("Reset", buttonx, resety); 
text("Save", buttonx, savey);
text("Palette Swap", buttonx, swapy);




int gradientSteps = 512;//how detailed will the gradient be
int gradientStripWidth = width/gradientSteps;//compute how many strips of the same width we'll need to fill the sketch

for(int i = 0; i < gradientSteps; i++){//for each gradient strip
  float t = map(i,0,gradientSteps,0.0,1.0);//compute i mapped from 0-gradientSteps to 0.0->1.0
  //this value will plug into lerpColor which does the colour interpolation for you
  color interpolatedColor = lerpColor(c1,c2,t);
  //finally, use the colour and draw some boxes 
  fill(interpolatedColor);
  rect(i*gradientStripWidth,0,gradientStripWidth,height);

}

}
void mouseClicked() {
  if(mouseX>buttonx && mouseY<resety && mouseY>resety-buttonh){
    println("Reset Button Clicked.");
    reset();
  }
  if(mouseX>buttonx && mouseY<savey && mouseY>savey-buttonh){
  println("Save Button Clicked.");
  savetex();
  }
  if(mouseX>buttonx && mouseY<swapy && mouseY>swapy-buttonh){
  println("Swap Button Clicked.");
  }

}

void savetex() {
  int file = floor(random(1000));
  PImage tex = get(0,0,1024,1024);
  tex.save("tex-" + file + ".png");
  print("Saved!");
}
void reset() {
  setup();
}
void swap() {
}