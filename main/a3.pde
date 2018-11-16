void a3_draw(){
  fill(0);
  for (Hand hand : leap.getHands ()) {

    PVector handPosition       = hand.getPosition();
    float   handGrab           = hand.getGrabStrength();

    
      float hg = handGrab*20;
      float hsp = map(handPosition.y,0,400,1,5);
      for (int x = 10; x < width; x += 40) {
        for (int y = 10; y < height; y += 40) {
          float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
          pushMatrix();
          translate(x, y);
          rotate(TWO_PI + hg * n);
          scale(20 * n);
          noStroke();
          rect(hg/10, hg/10, hsp, hsp);
          popMatrix();
        }
      }
    
  }
  

  
}