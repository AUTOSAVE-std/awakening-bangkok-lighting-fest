import de.voidplus.leapmotion.*;
LeapMotion leap;

float hg;
float t;
float theta;
int maxFrameCount = 200;
int a = 0;

void setup() {
  fullScreen(P3D);
  //size(540, 540, P2D);
  noFill();
  leap = new LeapMotion(this);
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
      pushMatrix();
      translate(width/2, height/2);

      t = (float)frameCount/maxFrameCount;
      theta = TWO_PI*t;

      for (float x = -1000; x <= width; x += 120) {
        for (float y = -1000; y <= height; y += 80) {
          float offSet = (x)*a;
          float sz1 = map(cos(-theta+offSet), -1, 1, -60, 0);
          float sz2 = map(cos(-theta+offSet), -1, 1, 60, -60);
          if (handGrab == 1){
            hg = 1000;
          }
          float rot = map(cos(-theta+offSet), -1, 1, 0, hg);

          strokeWeight(2);

          if ((x+y)%120 == 0) {
            stroke(#FF0000);
            shape(x, y, sz1, 100, rot);
          } else {
            stroke(#0000cc);
            shape(x, y, 50, sz2, -rot);
          }
          //println(handIsLeft);
        }
      }
      popMatrix();
    }
  }
}

void shape(float xPos, float yPos, float pOne, float pTwo, float rot) {
  pushMatrix();
  translate(xPos, yPos);
  rotate(radians(rot));
  rotate(radians(30));

  beginShape();
  vertex(-pOne, -pOne);
  vertex(-pOne, -pTwo);
  vertex(pOne, -pTwo);
  vertex(pOne, -pOne);
  vertex(pTwo, -pOne);
  vertex(pTwo, pOne);
  vertex(pOne, pOne);
  vertex(pOne, pTwo);
  vertex(-pOne, pTwo);
  vertex(-pOne, pOne);
  vertex(-pTwo, pOne);
  vertex(-pTwo, -pOne);
  endShape(CLOSE);

  popMatrix();
}
