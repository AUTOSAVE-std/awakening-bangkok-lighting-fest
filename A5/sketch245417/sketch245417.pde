import spout.*;
Spout spout;

import de.voidplus.leapmotion.*;
LeapMotion leap;

void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
<<<<<<< HEAD
 
  textSize(30);
=======
  randX=random(1.5, 2.5);
  randY=random(1.5, 2.5);
  textSize(10);
>>>>>>> 2534c05e15403ef6eb229a678e37775a1b300b8e

  for (int i=0; i<a.length; i++) {
    a[i]=i*70+15;
    b[i]=i*70+15;

    leap = new LeapMotion(this);
    spout = new Spout(this);
    spout.createSender("test : a5");
  }
}
float hg;
int c;
float prevX;
float prevY;
float newX;
float newY;

float speed = 1;

int move=0;

int a[]= new int[20];
int b[]= new int[20];

float d;


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

  /*
    //uncomment these if statements and comment out the mouseMoved() function
   //to automate
   
   if(mY<450 && move==0)
   mY+=speed;
   else if(mY>=450 && move==0){
   mX+=speed;
   move=1;      
   }else if(mX<450 && move==1)
   mX+=speed;
   else if(mX>=450 && move==1){
   mY-=speed;
   move=2;
   }else if(mY>50 && move==2)
   mY-=speed;
   else if(mY<=50 && move==2){
   mX-=speed;
   move=3;
   }else if(mX>50 && move==3)
   mX-=speed;
   else if(mX<=50 && move==3){
   mY+=speed;
   move=0;
   }
   */

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
<<<<<<< HEAD
      
      
      
      if(finger.getType() == 1) {
        hg = map(handGrab,0,1,10,40);
=======
      if (handGrab == 0) {
        hg = 25;
      } else if (handGrab > 0) {
        hg = 10;
      }
>>>>>>> 2534c05e15403ef6eb229a678e37775a1b300b8e

      fill(255);
      stroke(255);
      //translate((width/2)-50,(height/2)-50);
      for (int i=0; i<a.length; i++) {
        prevX=-1;
        for (int j=0; j<b.length; j++) {
          d=dist(handPosition.x, handPosition.y, a[i], b[j]);
          if (d==0)
            d=.005;
          newX=a[i]-(30/d)*(handPosition.x-a[i]);
          newY=b[j]-(30/d)*(handPosition.y-b[j]);
          if (prevX!=-1  && handGrab<0.9){
            //if(handGrab>0.8) {stroke(random(255),random(255),random(255));}
            line(prevX, prevY, newX, newY);
          }
          prevX=newX;
          prevY=newY;

          stroke(255);

        }
      }   
      for (int j=0; j<b.length; j++) {
        prevX=-1;
        for (int i=0; i<a.length; i++) {
          d=dist(handPosition.x, handPosition.y, a[i], b[j]);
          if (d==0)
            d=.001;
          newX=a[i]-(30/d)*(handPosition.x-a[i]);
          newY=b[j]-(30/d)*(handPosition.y-b[j]);
          if (prevX!=-1 && handGrab<0.9){
            
            line(prevX, prevY, newX, newY);
          }
          //if(handGrab>0.8) {
          //    stroke(random(255),random(200),random(160));
          //    line(prevX, prevY, handPosition.x, handPosition.y);
          //    fill(0);
          //    //bezier(prevX, prevY,prevX, prevY,newX, newY, newX, newY);
          //}
          if(handGrab>0.9) {fill(random(255),random(200),random(160));}
          stroke(0);
          ellipse(newX, newY, hg, hg);
          prevX=newX;
          prevY=newY;

          stroke(255);
        }
      }
      //translate(-width/2,-height/2);
      }
    }
  }
<<<<<<< HEAD
}
=======
  spout.sendTexture();
}
>>>>>>> 2534c05e15403ef6eb229a678e37775a1b300b8e
