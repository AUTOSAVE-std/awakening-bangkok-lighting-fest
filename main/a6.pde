void a6_draw(){
    fill(0);
  noStroke();
  rectMode(CENTER);
  noFill();
  strokeWeight(2);
        background(0); 
        stroke(255);

        
        
        for (Hand hand : leap.getHands ()) {
        float   handGrab           = hand.getGrabStrength();
        PVector handPosition       = hand.getPosition();    
        radius[0] =  new PVector(MIN_ELLIPSE+handGrab*(MAX_ELLIPSE-MIN_ELLIPSE/height), MIN_ELLIPSE+handPosition.y*(MAX_ELLIPSE-MIN_ELLIPSE)/height);
          ellipse(width/2, height/2, radius[0].x, radius[0].y);
  
  for (int i = 1; i < MAX_NB_CIRCLES; i++)
  {
    float deltaX = radius[i-1].x - radius[i].x + AVERAGE_DIST;
    float deltaY = radius[i-1].y - radius[i].y + AVERAGE_DIST;

    radius[i].x += deltaX * FRICTION;
    radius[i].y += deltaY * FRICTION;
    
    ellipse(width/2, height/2, radius[i].x, radius[i].y);
  }
  
          
  }
}