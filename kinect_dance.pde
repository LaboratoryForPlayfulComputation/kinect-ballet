import SimpleOpenNI.*;        // For interfacing with the Kinect
import codeanticode.syphon.*; // For using syphon to send frames out

SimpleOpenNI kinect;
SyphonServer server;
PImage kinectImage;
boolean sendFrames = false;

color[] userClr = new color[]{ color(255,0,0),
                               color(0,255,0),
                               color(0,0,255),
                               color(255,255,0),
                               color(255,0,255),
                               color(0,255,255)};

/* variables for storing joint data */
PVector head          = new PVector();
PVector neck          = new PVector();
PVector leftShoulder  = new PVector();
PVector leftElbow     = new PVector();
PVector leftHand      = new PVector();
PVector rightShoulder = new PVector();
PVector rightElbow    = new PVector();
PVector rightHand     = new PVector();
PVector torso         = new PVector();
PVector leftHip       = new PVector();
PVector leftKnee      = new PVector();
PVector leftFoot      = new PVector();
PVector rightHip      = new PVector();
PVector rightKnee     = new PVector();
PVector rightFoot     = new PVector();
PVector centerOfMass  = new PVector();

/* variables for storing x,y coord of joint */
PVector headPos          = new PVector();
PVector neckPos          = new PVector();
PVector leftShoulderPos  = new PVector();
PVector leftElbowPos     = new PVector();
PVector leftHandPos      = new PVector();
PVector rightShoulderPos = new PVector();
PVector rightElbowPos    = new PVector();
PVector rightHandPos     = new PVector();
PVector torsoPos         = new PVector();
PVector leftHipPos       = new PVector();
PVector leftKneePos      = new PVector();
PVector leftFootPos      = new PVector();
PVector rightHipPos      = new PVector();
PVector rightKneePos     = new PVector();
PVector rightFootPos     = new PVector();
PVector centerOfMassPos  = new PVector();

ArrayList<Particle> particles = new ArrayList<Particle>();

void settings() {
  size(640, 480, P2D);
  PJOGL.profile=1; // prevents OPENGL error 1282 when sending frames through Syphon
}

void setup() {
  kinect = new SimpleOpenNI(this);
  if (kinect.isInit() == false) {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  kinect.enableDepth();
  kinect.enableRGB();
  kinect.enableUser();
  //server = new SyphonServer(this, "Kinect Processing");
}

void draw() {
  kinect.update();
  kinectImage = kinect.userImage();
  
  int[] userList = kinect.getUsers();
  for (int i=0; i < userList.length; i++) {
    int userId = userList[i];
    if (kinect.isTrackingSkeleton(userId)) {
      stroke(userClr[ (userId - 1) % userClr.length ] );
      drawBody(userId);
      drawSkeleton(userId);
      drawCOM(userId);
      drawHandTrails(userId);
    }       
  }    
  
  /* if (sendFrames) {
    server.sendScreen();
  } */
  
  image(kinectImage, 0, 0, width, height);
}