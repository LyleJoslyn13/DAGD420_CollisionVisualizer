// This Program runs a Collision Visualizer for AABB and Radial Objects

SceneTitle sceneTitle;
SceneRadial sceneRadial;
SceneAABB sceneAABB;

float dt = 0;
float prevTime = 0;

void setup() {
  size(600,600);
}

void draw() {
  switchToTitle();
  calcDeltaTime();
  background(128);
  
  if(sceneTitle != null){
    sceneTitle.update();
    if(sceneTitle != null) sceneTitle.draw(); // this extra if statement exists because the sceneTitle.update() might result in the scene switching...
  }
  
}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

void switchToTitle(){                      // setting the scene to title screen //
  sceneTitle = new SceneTitle();
  // SET ALL SCENES TO NULL BELOW THIS!!!!!!!!!!!!!!!!!!!!!!
  sceneRadial = null;
  sceneAABB = null;
}

void switchToRadial(){                      // setting the scene to title screen //
  sceneRadial = new SceneRadial();
  // SET ALL SCENES TO NULL BELOW THIS!!!!!!!!!!!!!!!!!!!!!!
  sceneTitle = null;
  sceneAABB = null;
}

void switchToAABB(){                      // setting the scene to title screen //
  sceneAABB = new SceneAABB();
  // SET ALL SCENES TO NULL BELOW THIS!!!!!!!!!!!!!!!!!!!!!!
  sceneTitle = null;
  sceneRadial = null;
}
