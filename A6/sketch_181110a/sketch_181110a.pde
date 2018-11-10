//import spout.*;
//Spout spout;

import de.voidplus.leapmotion.*;
LeapMotion leap;


// Nervous Waves 2
// Levente Sandor, 2014
final int MAX_NB_CIRCLES = 200;
final float AVERAGE_DIST = 10;

final float MIN_ELLIPSE = 1;
final float MAX_ELLIPSE = 60;

final float FRICTION = .5;

PVector[] radius;

void setup() {
  fullScreen(P3D);
  //size(500, 500);
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  noFill();
  strokeWeight(2);
  stroke(255);
  radius = new PVector[MAX_NB_CIRCLES];
  for (int i = 1; i < MAX_NB_CIRCLES; i++)
  {
      radius[i] =  new PVector(2*i*MIN_ELLIPSE, 2*i*MIN_ELLIPSE);
  }
  leap = new LeapMotion(this);
  //spout = new Spout(this);
  //spout.createSender("Test : A3");
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
      background(0); 
      
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

  
  radius[0] =  new PVector(MIN_ELLIPSE+handGrab*(MAX_ELLIPSE-MIN_ELLIPSE), MIN_ELLIPSE+handPosition.y*(MAX_ELLIPSE-MIN_ELLIPSE)/height);
  ellipse(width/2, height/2, radius[0].x, radius[0].y);
  
  for (int i = 1; i < MAX_NB_CIRCLES; i++)
  {
    float deltaX = radius[i-1].x - radius[i].x + AVERAGE_DIST;
    float deltaY = radius[i-1].y - radius[i].y + AVERAGE_DIST;
    
    radius[i].x += deltaX * FRICTION;
    radius[i].y += deltaY * FRICTION;
    
    ellipse(width/2, height/2, radius[i].x, radius[i].y);
  }


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
     
    }
  }
  //spout.sendTexture();
}