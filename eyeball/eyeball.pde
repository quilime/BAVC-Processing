
Eye eye;

void setup() {
  
  size(200, 200);
  smooth(); 
  
  eye = new Eye(width/2, height/2, 50, 30, 40);
  
}

void draw() {
  
  background(255);
  
  eye.update();
  eye.draw();
  
}


