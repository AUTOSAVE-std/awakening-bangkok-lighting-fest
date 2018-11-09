import spout.*;
Spout spout;

import de.voidplus.leapmotion.*;
LeapMotion leap;


// Nervous Waves 2
// Levente Sandor, 2014
int hg;

void setup() {
  fullScreen(P3D);
  //size(500, 500);
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  noiseDetail(2, 0.9);

  leap = new LeapMotion(this);
  spout = new Spout(this);
  spout.createSender("Test : A3");
}

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

void draw() {
      background(255);
      
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


    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();



      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        break;
      case 1:
        // fingerPositionSystem.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }
      for (int x = 10; x < width; x += 40) {
        for (int y = 10; y < height; y += 40) {
          float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
          //println(x);
          pushMatrix();
          translate(x, y);
          if (handGrab == 1){
            hg = 100;
          }else{
            hg = 0;
          }
          rotate(TWO_PI + hg * n);
 
          scale(20 * n);
          println(n);
          rect(hg/10, hg/10, 1, 1);
          popMatrix();
        }
      }
    }
  }
  spout.sendTexture();
}
