

    PImage img;

    color bgcolor   = color(120, 120, 120);
    color drawColor = color(255, 255, 255);
    
    int inc = 0;
    
    void setup()
    {
      size(600, 600);
      background(128);  
      
      img = loadImage("katydid.jpg"); 
    }
    

    void draw()
    {
      if (inc > 100) {
         inc = 0; 
      }
      else {
        inc++;
      }
      
    }


    void mouseDragged() 
    {  
      strokeWeight( inc ); 
      stroke( drawColor );
      
      //image(img, mouseX, mouseY); 
      
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    
    
    void mouseReleased() 
    {
    }


    void keyPressed()
    {
        switch(key)
        {
          
           case 'q' : 
             drawColor = color( 255, 0, 0 ); 
             break;
             
           case 'w' : 
             drawColor = color( 0, 255, 0 ); 
             break;                
             
        }
    }




















   
