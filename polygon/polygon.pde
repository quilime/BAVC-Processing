// polygon function

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  
  background(0);
  noStroke();
  fill(255);
  
  // tests
  polygon(100, 100, 5, 40);  
  polygon(200, 100, 6, 40);  
  polygon(300, 100, 7, 40);    
  polygon(100, 300, 7, 40);      
  polygon(200, 300, 3, 40);        
  polygon(300, 300, 8, 40);
}

void polygon(int _x, int _y, int sides, float radius) {
  
  if (sides <= 0)
    sides = 1;
  
  beginShape();
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i)) * radius;
    float y = _y + cos(radians(i)) * radius;
    vertex(x, y);
//    ellipse(x, y, 2, 2);
  }
  endShape();
}
