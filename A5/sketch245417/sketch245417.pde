void setup(){
  size(800,600);
  mX=-10000;
  mY=-10000;
  randX=random(1.5,2.5);
  randY=random(1.5,2.5);
  textSize(16);
  
  for(int i=0; i<a.length;i++){
    a[i]=i*20+140;
    b[i]=i*20+50;
  }
}

float mX;
float mY;
//these are coordinates for the ball. If you wanted to use your mouse,
//you'd set these equal to MouseX and MouseY in mouseMoved()

float prevX;
float prevY;
float newX;
float newY;

float speed = 2;

int move=0;

int a[]= new int[25];
int b[]= new int[25];

//because I'm lazy and didn't want to make a fillArray() function

float d;
//used when calculating distance between ball and point

float randX;
float randY;
//the random speed at which the ball moves in X and Y

void draw(){
    
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
    
    background(255);    
    fill(0);
    stroke(0);
    for (int i=0;i<a.length;i++){
        prevX=-1;
        for(int j=0;j<b.length;j++){
           d=dist(mX,mY,a[i],b[j]);
           if(d==0)
               d=.0001;
           newX=a[i]-(25/d)*(mX-a[i]);
           newY=b[j]-(25/d)*(mY-b[j]);
           
           ellipse(newX,newY,10,10);
           if(prevX!=-1)
             line(prevX,prevY,newX,newY);
           prevX=newX;
           prevY=newY;
           
           stroke(0);

           //iterate through the array, calculate distance (d) between mouse
           //and each point, then move each point by (25/d)*(mouseX-pointX) and in
           //Y. I took a lot of mathematical liberty here and just fucked with it
           //till it worked. The idea was that if the slope created by the ball and
           //the point is 3/4 and I want to move the point by a factor of 5, 
           //I move x by 5*4 points and y by 5*3. Someone who's good at math would
           //write an equation that makes more sense
          
        }
    }   
      for (int j=0;j<b.length;j++){
        prevX=-1;
        for(int i=0;i<a.length;i++){
           d=dist(mX,mY,a[i],b[j]);
           if (d==0)
             d=.001;
           newX=a[i]-(25/d)*(mX-a[i]);
           newY=b[j]-(25/d)*(mY-b[j]);
           if(prevX!=-1)
             line(prevX,prevY,newX,newY);
           prevX=newX;
           prevY=newY;
           
           stroke(0);          
        }
    }   
    

}


void mouseMoved(){
  mX=mouseX;
  mY=mouseY;
}