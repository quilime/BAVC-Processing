void setup() {
  size(400, 400); 
  smooth();
  strokeWeight(6);
}

void draw() {
  background(120);
  face( width/2, height/2, 160 );
  drawFloor();
}

void drawFloor() {
 stroke(0);
 line(0, 350, width, 350); 
}

void face( float x, float y, float size ) {
  fill(255);
  stroke(0);
  ellipse(x, y, size, size);
  eye( x - 50,  y, 20 );
  eye( x + 50,  y, 60 );
  for (int i = 0; i < 18; i+=2) {
    hair( x + i*3 - 30, y - 50, 50, i * 0.8 );
  }
}

void hair(float x, float y, float len, float craziness )
{
   stroke(198, 90, 6);
   beginShape();
   vertex(x, y);
   vertex(x + craziness, y - len);
   endShape();  
}

void eye(float x, float y, float eyeball_size) {
  fill(255, 245, 180);
  ellipse(x, y, eyeball_size, eyeball_size);
  fill(0);
  ellipse(x, y, 4, 4);
}







