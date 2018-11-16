void a1_draw(){
  stroke(255);
  background(0);
  int l = 30;
  float easing = 0.06;
  for (Hand hand : leap.getHands ()) {
    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();


      sx += (handPosition.x - sx) * easing;
      sy += (handPosition.y - sy) * easing;


      strokeWeight(2);

      for (int i = 0; i < width+100; i+= 30) {
        for ( int y = 0; y < height+100; y += 30) {
          float d = dist(i, y, sx, sy);
          float f = l / d;
          float dx = sx - i;
          float dy = sy - y;
          if ( handGrab == 1 ) {
            dx *= -1;
            dy *= -1;
            stroke(random(255), random(255), random(255));
          } else if ( handGrab == 0 ) {
            stroke(255);
          }
          noFill();
          curve(i, y, i+ dx*f, y+dy*f, i+ dx*f, y+dy*f, sx, sy);
          //arc(i, y, abs(dx*f), abs(dy*f), HALF_PI, PI);
        }
      }



  }
  
  
}