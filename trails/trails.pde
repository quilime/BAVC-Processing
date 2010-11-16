int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
float size[] = new float[num];

void setup() {
  size(400, 400);
  strokeWeight(10);
  smooth();
}

void draw() { 
  background(0); 
  fill(255);
  noStroke();
  
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  size[which] = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);

  for (int i = 0; i < num; i++) {
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], size[index], size[index]);
  }
}

