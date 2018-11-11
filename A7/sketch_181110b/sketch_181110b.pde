
import de.voidplus.leapmotion.*;
LeapMotion leap;

int mouseSize = 500;


void setup() {
  fullScreen(P3D);
  //size(500, 500);
  leap = new LeapMotion(this);
}


void draw() {
  background(0);
  stroke(255);
 
         for (Hand hand : leap.getHands ()) {
    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();
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