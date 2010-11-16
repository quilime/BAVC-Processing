  void setup() {
    size(350, 350);
    smooth();
    noStroke();
  }
  void draw() {
    background(0);
    for (int x = 0 ; x < width; x+= 20) {
      for (int y = 0; y < height; y+= 20) {      
  
        float d = dist(x, y, mouseX, mouseY) / 10;
  
        float w = d;
        float h = d;
  
        fill(180, 255, 0);
        
        ellipse(x, y, w, h);        
      }
    }
  }
  
