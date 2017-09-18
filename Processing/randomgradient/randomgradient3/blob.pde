class Blob{
  PVector pos;
  float r;
  PVector vel;
  
  Blob(float x, float y) {
  pos = new PVector(x,y);
  vel = PVector.random2D();
  vel.mult(random(2, 5));
  r = 40;
 }
 void update() {
   pos.add(vel);
   if (pos.x > width) {
     pos.x = 0;
   }
   if (pos.x < 0) {
     pos.x = width;
   }
      if (pos.y > height) {
     pos.y = 0;
   }
     if (pos.y < 0) {
     pos.y = height;
   }
   //make it so that when one moves to the top, it appears from the bottom, asteroids style
 }
 
 void show() {
   noFill();
   stroke(0);
   strokeWeight(4);
   ellipse(pos.x, pos.y, r*2, r*2);
 }
 }