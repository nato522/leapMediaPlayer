import de.voidplus.leapmotion.*;

// ======================================================
// Table of Contents:
// ├─ 1. Swipe Gesture
// ├─ 2. Circle Gesture
// ├─ 3. Screen Tap Gesture
// └─ 4. Key Tap Gesture
// ======================================================


LeapMotion leap;
Boolean swipe = false;

void setup(){
  size(800, 500);
  background(255);
  // ...

  leap = new LeapMotion(this).allowGestures();  // All gestures
  // leap = new LeapMotion(this).allowGestures("circle, swipe, screen_tap, key_tap");
  // leap = new LeapMotion(this).allowGestures("swipe");  // Leap detects only swipe gestures
}
// 1. Callbacks

void leapOnInit() {
  //println("Leap Motion Init");
}
void leapOnConnect() {
  println("Leap Motion Connect");
}
void leapOnFrame() {
  //println("Leap Motion Frame");
}
void leapOnDisconnect() {
  //println("Leap Motion Disconnect");
}
void  leapOnExit() {
  println("Leap Motion Exit");
}

void draw(){
  background(255);
  // ...
  for (Hand hand : leap.getHands ()  ) {
    hand.draw();
    if(hand.getGrabStrength() == 1 && swipe == false) {
      System.out.println("Play/Stop");
      //delay(500);
    }
    /*if(hand.getSphereRadius() > 60 && swipe == false) {
      System.out.println("Play/Stop");
      //delay(500);
    }*/

  }
}


// ======================================================
// 1. Swipe Gesture

void leapOnSwipeGesture(SwipeGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  switch(state){
    case 1: // Start
      swipe = true;
      break;
    case 2: // Update
      break;
    case 3: // Stop
      //println("SwipeGesture: " + direction);
      String swipeDirection = "";
      //Classify swipe as either horizontal or vertical
      boolean isHorizontal = Math.abs(direction.array()[0]) > Math.abs(direction.array()[1]);
      //Classify as right-left or up-down
      /*if(isHorizontal){
          if(direction.array()[0] > 0){
              swipeDirection = "right";
          } else {
              swipeDirection = "left";
          }
      } else { //vertical
          if(direction.array()[1] > 0){
              swipeDirection = "up";
          } else {
              swipeDirection = "down";
          }                  
      }*/
      if(!isHorizontal){
          if(direction.array()[1] < -80 && direction.array()[0] > -10 && direction.array()[0] < 30){
            swipeDirection = "Volume Down";
            System.out.println(swipeDirection);
        } else {
          swipeDirection = "Volume Up";
          System.out.println(swipeDirection);
        }
      }
      swipe = false;
      //System.out.println(swipeDirection);
      break;
  }
}


// ======================================================
// 2. Circle Gesture

void leapOnCircleGesture(CircleGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector positionCenter   = g.getCenter();
  float   radius           = g.getRadius();
  float   progress         = g.getProgress();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  int     direction        = g.getDirection();
  
  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      if (direction == 1)  System.out.println("Next Song");
      else if (direction == 0) System.out.println("Previous Song");
      //println("CircleGesture: " + id);
      break;
  }

  switch(direction){
    case 0: // Anticlockwise/Left gesture
      //println("Circle Left");
      break;
    case 1: // Clockwise/Right gesture
      //println("Circle Right");
      break;
  }
}


// ======================================================
// 3. Screen Tap Gesture

/*void leapOnScreenTapGesture(ScreenTapGesture g){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("ScreenTapGesture: " + id);
}*/


// ======================================================
// 4. Key Tap Gesture

/*void leapOnKeyTapGesture(KeyTapGesture g){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("KeyTapGesture: " + id);
}*/
