void a5_draw(){
  background(0);
  for (Hand hand : leap.getHands ()) {
    PVector handPosition       = hand.getPosition();
    float   handGrab           = hand.getGrabStrength();
        hgg = map(handGrab,0,1,10,50);
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
          ellipse(newX, newY, hgg, hgg);
          prevX=newX;
          prevY=newY;

          stroke(255);
        }
      }
    
    
  }
}