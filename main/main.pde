import de.voidplus.leapmotion.*;
LeapMotion leap;
int lastTimeCheck;
int timeIntervalFlag = 3000;
int switchScene = 1;

// a1 
  float sx = 0;
  float sy = 0;
// a3 
int hg;

// a5 
float hgg;
int c;
float prevX;
float prevY;
float newX;
float newY;
float speed = 5;
int move=0;
int a[]= new int[20];
int b[]= new int[20];
float d;
// a6
final int MAX_NB_CIRCLES = 100;
final float AVERAGE_DIST = 10;
final float MIN_ELLIPSE = 1;
final float MAX_ELLIPSE = 50;
final float FRICTION = .5;
PVector[] radius;
// a7 
int mouseSize = 500;

void setup() {
  fullScreen();
  background(255);
  leap = new LeapMotion(this);
  lastTimeCheck = millis();
  for (int i=0; i<a.length; i++) {
    a[i]=i*70+15;
    b[i]=i*70+15;
  }
  
  // a6
  fill(0);
  noStroke();
  rectMode(CENTER);
  noFill();
  strokeWeight(2);
  stroke(255);
  radius = new PVector[MAX_NB_CIRCLES];
  for (int i = 1; i < MAX_NB_CIRCLES; i++)
  {
      radius[i] =  new PVector(2*i*MIN_ELLIPSE, 2*i*MIN_ELLIPSE);
  }
}


void draw() {
  background(255);
  
  if ( millis() > lastTimeCheck + timeIntervalFlag ) {
    lastTimeCheck = millis();
    if(switchScene==5){switchScene=1;} else switchScene++;
  }
  
  switch(switchScene){
    case 1:
      a1_draw();
      break;
    case 2:
      a3_draw();
      break;
    case 3:
      a5_draw();
      break;
    case 4:
      a7_draw();
      break;
    
  }
  for (Hand hand : leap.getHands ()) {
    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();

  }
  blackontop();
}