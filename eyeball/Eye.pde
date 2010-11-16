

class Eye
{
  int x, y;
  float irisX, irisY;
  float localMX, localMY;
  float xr, yr, pupilradius;
  float ease = 0.2;

  Eye(int _x, int _y, float _xradius, float _yradius, float _pupilradius) {
    x = _x;
    y = _y;
    localMX = x;
    localMY = y;
    xr = _xradius;
    yr = _yradius;
    pupilradius = _pupilradius;
  }

  void draw()
  {
    stroke(0);  
    pushMatrix();

    // draw eye
    translate(x,y);
    ellipseMode(RADIUS);
    ellipse(0, 0, xr, yr);
    
    // draw iris
    fill(200);
    ellipse(irisX, irisY, pupilradius, pupilradius);
    fill(0);    
    ellipse(irisX, irisY, pupilradius/3, pupilradius/3);        
    
    popMatrix();
  }

  void update()
  {
    localMX = mouseX-x;
    localMY = mouseY-y;
    
    float targetX = constrain(localMX, -xr, xr);
    float targetY = constrain(localMY, -yr, yr);
    
    irisX += (targetX - irisX) * ease;
    irisY += (targetY - irisY) * ease;
  }
}

