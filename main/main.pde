import de.voidplus.leapmotion.*;
LeapMotion leap;
int lastTimeCheck;
int timeIntervalFlag = 3000;
int switchScene = 1;
void setup() {
  fullScreen();
  background(255);
  leap = new LeapMotion(this);
  lastTimeCheck = millis();
}


void draw() {
  background(255);
  
  if ( millis() > lastTimeCheck + timeIntervalFlag ) {
    lastTimeCheck = millis();
    if(switchScene==9){switchScene=1;} else switchScene++;
  }
  
  switch(switchScene){
    case 1:
      a1_draw();
      break;
    case 2:
      a2_draw();
      break;
  }
  for (Hand hand : leap.getHands ()) {
    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();

  }
}