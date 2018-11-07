import spout.*;
import de.voidplus.leapmotion.*;

Spout spout;
LeapMotion leap;

int l = 30;
float sx = 0;
float sy = 0;
float easing = 0.06;

void setup() {
  background(0);
  //fullScreen(P3D);
  size(600, 600, P3D);
  stroke(255);
  leap = new LeapMotion(this);

  spout = new Spout(this);

  spout.createSender("Test 1 : p1");
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

  

  //int fps = leap.getFrameRate();
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
      //sx += (handPosition.x - sx) * easing;
      //sy += (handPosition.y - sy) * easing;

      sx += (fingerPosition.x - sx) * easing;
      sy += (fingerPosition.y - sy) * easing;


      strokeWeight(2);

      for (int i = 100; i < width; i+= 100) {
        for ( int y = 100; y < height; y += 100) {
          float d = dist(i, y, sx, sy);
          float f = l / d;
          float dx = sx - i;
          float dy = sy - y;
          if ( handGrab == 1 ) {
            dx *= -1;
            dy *= -1;
            stroke(random(255), 0, random(255));
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
  spout.sendTexture();
}
