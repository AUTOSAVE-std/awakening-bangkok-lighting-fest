void a7_draw(){
  background(0);
  stroke(255);
 
         for (Hand hand : leap.getHands ()) {
    PVector handPosition       = hand.getPosition();
 
    float   handGrab           = hand.getGrabStrength();
 
  for (int y = 0; y < height; y += 40) {
    for (int x = 0; x < width; x += 40) {
      PVector pos = new PVector(x, y);
      
      float d = dist(x, y, handPosition.x, handPosition.y);
      
      pos.sub(handPosition.x, handPosition.y);
      pos.normalize();
      pos.mult(mouseSize-d);
      
      if (d < mouseSize) {
        pos.mult(0.25);
      } else {
        pos.mult(-d*0.001);
      }
      
      pos.add(x, y);
      
      strokeWeight(max((mouseSize-min(d, mouseSize))*0.05, 2, map(handGrab,0,1,0,30)));
      if(handGrab>0.8) stroke((map(handGrab,0,1,0,255)), random(map(handGrab,0,1,0,255)),random(map(handGrab,0,1,0,255)));
      point(pos.x+random(map(handGrab,0,1,0,10)), pos.y+random(map(handGrab,0,1,0,10)));
    }
  }
    
   }
}