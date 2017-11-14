
void drawBody(int userId) {
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
}

void drawSkeleton(int userId) {  
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, head); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_NECK, neck); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, leftShoulder); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, leftElbow); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, leftHand); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, rightShoulder); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, rightElbow); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, rightHand); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_TORSO, torso); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HIP, leftHip); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_KNEE, leftKnee); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_FOOT, leftFoot); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HIP, rightHip); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, rightKnee); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_FOOT, rightFoot); 
  kinect.getCoM(userId, centerOfMass);
  
  kinect.convertRealWorldToProjective(head, headPos);
  kinect.convertRealWorldToProjective(neck, neckPos);
  kinect.convertRealWorldToProjective(leftShoulder, leftShoulderPos);
  kinect.convertRealWorldToProjective(leftElbow, leftElbowPos);
  kinect.convertRealWorldToProjective(leftHand, leftHandPos);
  kinect.convertRealWorldToProjective(rightShoulder, rightShoulderPos);
  kinect.convertRealWorldToProjective(rightElbow, rightElbowPos);
  kinect.convertRealWorldToProjective(rightHand, rightHandPos);
  kinect.convertRealWorldToProjective(torso, torsoPos);
  kinect.convertRealWorldToProjective(leftHip, leftHipPos);
  kinect.convertRealWorldToProjective(leftKnee, leftKneePos);
  kinect.convertRealWorldToProjective(leftFoot, leftFootPos);
  kinect.convertRealWorldToProjective(rightHip, rightHipPos);
  kinect.convertRealWorldToProjective(rightKnee, rightKneePos);
  kinect.convertRealWorldToProjective(rightFoot, rightFootPos);
  kinect.convertRealWorldToProjective(centerOfMass, centerOfMassPos);  

  stroke(226, 142, 255); // light pink
  line(headPos.x, headPos.y, neckPos.x, neckPos.y); // connect head to neck
  line(neckPos.x, neckPos.y, leftShoulderPos.x, leftShoulderPos.y);
  line(leftShoulderPos.x, leftShoulderPos.y, leftElbowPos.x, leftElbowPos.y);
  line(leftElbowPos.x, leftElbowPos.y, leftHandPos.x, leftHandPos.y);
  line(neckPos.x, neckPos.y, rightShoulderPos.x, rightShoulderPos.y);
  line(rightShoulderPos.x, rightShoulderPos.y, rightElbowPos.x, rightElbowPos.y);
  line(rightElbowPos.x, rightElbowPos.y, rightHandPos.x, rightHandPos.y);
  line(leftShoulderPos.x, leftShoulderPos.y, torsoPos.x, torsoPos.y);
  line(rightShoulderPos.x, rightShoulderPos.y, torsoPos.x, torsoPos.y);
  line(torsoPos.x, torsoPos.y, leftHipPos.x, leftHipPos.y);
  line(leftHipPos.x, leftHipPos.y, leftKneePos.x, leftKneePos.y);
  line(leftKneePos.x, leftKneePos.y, leftFootPos.x, leftFootPos.y);
  line(torsoPos.x, torsoPos.y, rightHipPos.x, rightHipPos.y);
  line(rightHipPos.x, rightHipPos.y, rightKneePos.x, rightKneePos.y);
  line(rightKneePos.x, rightKneePos.y, rightFootPos.x, rightFootPos.y);  
}

void drawCOM(int userId) {
  kinect.getCoM(userId, centerOfMass);
  kinect.convertRealWorldToProjective(centerOfMass, centerOfMassPos);
  stroke(100,255,0);
  strokeWeight(1);
  beginShape(LINES);
  vertex(centerOfMassPos.x, centerOfMassPos.y - 5);
  vertex(centerOfMassPos.x, centerOfMassPos.y + 5);
  vertex(centerOfMassPos.x - 5, centerOfMassPos.y);
  vertex(centerOfMassPos.x + 5, centerOfMassPos.y);
  endShape();  
}

void drawHandTrails(int userId) {
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, leftHand); 
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, rightHand);
  kinect.convertRealWorldToProjective(leftHand, leftHandPos);
  kinect.convertRealWorldToProjective(rightHand, rightHandPos);
  particles.add(new Particle(leftHandPos.x, leftHandPos.y));
  particles.add(new Particle(rightHandPos.x, rightHandPos.y));
  IntList particlesToRemove = new IntList();
  for (int i = 0; i < particles.size(); i++) {
    Particle particle = particles.get(i);
    particle.decreaseLifetime();
    if (particle.getLifetime() <= 0) {
      particlesToRemove.append(i);
    } else {
      particle.display();
    }
    
  }
  for (int i = 0; i < particlesToRemove.size(); i++) {
    particles.remove(particlesToRemove.get(i));
  }
}

// SimpleOpenNI events
void onNewUser(SimpleOpenNI curContext, int userId) {
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId) {
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId) {
  //println("onVisibleUser - userId: " + userId);
}

class Particle {
  int lifetime;
  float x;
  float y;
  
  Particle(float xPos, float yPos) {
    this.x = xPos;
    this.y = yPos;
    this.lifetime = 10;
  }
  
  void decreaseLifetime() {
    this.lifetime -= 1;
  }
  
  void display() {
    fill(255);
    ellipse(this.x, this.y, 5, 5);
  }
  
  int getLifetime() {
    return this.lifetime;
  }
  
  
}