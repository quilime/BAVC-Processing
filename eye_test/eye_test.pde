Eye eye, eye2, eye3;
float eyeborder = 60;
float smallborder = 20;
int mover = 0;
 
void setup()
{
  size(480, 320);
  
  frameRate(60);
  
  eye = new Eye(width/2, height/2, color(255,255,0), "one", true);
  
  smooth();
}
 
void draw()
{
  background(255);
  eye.update();
  eye.draw();
  //eye.move(mouseX, mouseY);
}
 
class Eye
{
  float centerX, centerY, targetCenterX, targetCenterY, positionX, positionY;
  float pupil_diameter, maxPupilDiameter, minPupilDiameter, pupilEase;
  float tempTargetX, tempTargetY, maxWanderDist, wanderFudge, wanderEase, maxWanderEase, minWanderEase, wanderEaseDX;
  float irisX, irisY, irisAngle, maxIrisDistance, centerTrackSpeed;
  color col;
  float ease, maxEase, minEase, easeChange;
  String name;
  Boolean lefteye;
  public Eye(float X, float Y, color c, String n, Boolean leftOrientation)
  {
    name = n;
    centerX = X;
    centerY = Y;
    targetCenterX = centerX;
    targetCenterY = centerY;
    positionX = X;
    positionY = Y;
    irisX = positionX;
    irisY = positionY;
    irisAngle = 0.0;
    //col = c;
    col = color(255);
    pupil_diameter = 12;
    maxPupilDiameter = 12;
    minPupilDiameter = 6;
    pupilEase = 0.05;
    ease = 0.01;
    maxEase = 0.75;
    minEase = 0.01;
    easeChange = 0.01;
    maxIrisDistance = 9;
    maxWanderDist = random(eyeborder);
    tempTargetX = 0;
    tempTargetY = 0;
    wanderFudge = 1.0;
    wanderEase = 0.01;
    minWanderEase = 0.01;
    maxWanderEase = 0.5;
    wanderEaseDX = 0.001;
    centerTrackSpeed = 2.0;
    lefteye = leftOrientation;
  }
   
  int getCenterX()
  {
    return int(centerX);
  }
   
  int getCenterY()
  {
    return int(centerY);
  }
   
  void agitate()
  {
    // agitate the pupil easing
    if (ease < maxEase)
    {
      ease += easeChange;
    }
    if (ease > maxEase)
    {
      ease = maxEase;
    }
     
    // shrink the pupil
    if (pupil_diameter > minPupilDiameter)
    {
      pupil_diameter += (minPupilDiameter-pupil_diameter)*pupilEase;
    }
    if (pupil_diameter < minPupilDiameter)
    {
      pupil_diameter = minPupilDiameter;
    }
 
    // agitate the wandering
    maxWanderDist = eyeborder;
    if (wanderEase < maxWanderEase)
    {
      wanderEase += wanderEaseDX;
    }
    if (wanderEase > maxWanderEase)
    {
      wanderEase = maxWanderEase;
    }
  }
   
  void calm()
  {
    // relax the pupil easing
    if (ease > minEase)
    {
      ease -= easeChange;
    }
    if (ease < minEase)
    {
      ease = minEase;
    }
     
    // dialate the pupil
    if (pupil_diameter < maxPupilDiameter)
    {
      pupil_diameter += (maxPupilDiameter-pupil_diameter) * pupilEase;
    }
    if (pupil_diameter > maxPupilDiameter)
    {
      pupil_diameter = maxPupilDiameter;
    }
     
    // relax the wandering
    if (wanderEase > minWanderEase)
    {
      wanderEase -= wanderEaseDX;
    }
    if (wanderEase < minWanderEase)
    {
      wanderEase = minWanderEase;
    }
    maxWanderDist = random(eyeborder);
  }
   
  void draw()
  {
    noStroke();
     
    // local coordinates to mouse from eye
    float localMX = mouseX-positionX;
    float localMY = mouseY-positionY;
     
    float angle = atan2(localMY, localMX);
    float targetX = (maxIrisDistance * cos(angle)) + positionX;
    float targetY = (maxIrisDistance * sin(angle)) + positionY;
     
    irisX += (targetX - irisX) * ease;
    irisY += (targetY - irisY) * ease;
 
    // draw the eye
    float orient;
    if (lefteye) // draws inverse x coordinates
    {
      orient = -1;
    }
    else
    {
      orient = 1;
    }
    fill(255);
    stroke(0);
    strokeWeight(1);
    beginShape();
    vertex((orient*0)+positionX,-18+positionY);
    bezierVertex((orient*-25) + positionX, -15 + positionY, (orient*-39) + positionX, -2 + positionY, (orient*-39) + positionX, 4 + positionY);
    bezierVertex((orient*-29) + positionX, 6 + positionY, (orient*-13) + positionX, 21 + positionY, (orient*2) + positionX, 19 + positionY);
    bezierVertex((orient*15) + positionX, 18 + positionY, (orient*35) + positionX, 16 + positionY, (orient*38) + positionX, 4 + positionY);   
    bezierVertex((orient*39) + positionX, 1 + positionY, (orient*36) + positionX, 3 + positionY, (orient*34) + positionX, 1 + positionY);
    bezierVertex((orient*33) + positionX, 0 + positionY, (orient*32) + positionX, -3 + positionY, (orient*31) + positionX, -4 + positionY);
    bezierVertex((orient*21) + positionX, -10 + positionY, (orient*21) + positionX, -18 + positionY, (orient*0) + positionX, -18 + positionY);
    endShape();
 
    // draw the iris
    fill(col);
    ellipseMode(CORNERS);
    float irisLeft = irisX-17;
    float irisRight = irisX+17;
    float irisTop = max(irisY-17, positionY-17);
    float irisBot = min(irisY+17, positionY+19);
    ellipse(irisLeft, irisTop, irisRight, irisBot);
     
    // draw the pupil
    fill(0);
    ellipseMode(CENTER);
    ellipse(irisX, irisY, pupil_diameter, pupil_diameter);
     
    // draw reflection
    fill(255);
    ellipse(positionX+14, positionY+3, 4, 4);
  }
   
  void update()
  {
    //fill(255,0,0);
    //ellipseMode(CENTER);
    //ellipse(centerX, centerY, 10,10);
    if (targetCenterX != centerX)
    {
      float originalX = centerX;
      if (centerX > targetCenterX)
      {
        centerX -= centerTrackSpeed;
        if (centerX < targetCenterX)
        {
          centerX = targetCenterX;
        }
      }
      else
      {
        centerX += centerTrackSpeed;
        if (centerX > targetCenterX)
        {
          centerX = targetCenterX;
        }
      }
      tempTargetX = centerX;
    }
     
    if (targetCenterY != centerY)
    {
      float originalY = centerY;
      if (centerY > targetCenterY)
      {
        centerY -= centerTrackSpeed;
        if (centerY < targetCenterY)
        {
          centerY = targetCenterY;
        }
      }
      else
      {
        centerY += centerTrackSpeed;
        if (centerY > targetCenterY)
        {
          centerY = targetCenterY;
        }
      }
      tempTargetY = centerY;
    }
  }
   
  void move(float newcenterX, float newcenterY)
  {
    //println("moving eye " + name + " to " + newcenterX + ", " + newcenterY);
    targetCenterX = newcenterX;
    targetCenterY = newcenterY;
  }
}
