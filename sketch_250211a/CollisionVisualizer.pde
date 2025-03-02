// This Program runs a Collision Visualizer for AABB and Radial Objects

SceneTitle sceneTitle;
SceneFinish sceneFinish;
SceneRadialAnimation sceneRadialAnimation;
SceneRadialCode sceneRadialCode;
SceneRadialVisualizer sceneRadialVisualizer;
SceneAABBAnimation sceneAABBAnimation;
SceneAABBCode sceneAABBCode;
SceneAABBVisualizer sceneAABBVisualizer;

float dt = 0;
float prevTime = 0;

void setup() {
  size(1000,1000);
  switchToTitle();
}

void draw() {
  calcDeltaTime();
  
  if(sceneTitle != null){
    sceneTitle.update();
    if(sceneTitle != null) sceneTitle.draw(); 
  }
  else if(sceneFinish != null){
    sceneFinish.update();
    if(sceneFinish != null) sceneFinish.draw(); 
  }
  else if(sceneRadialAnimation != null){
    sceneRadialAnimation.update();
    if(sceneRadialAnimation != null) sceneRadialAnimation.draw(); 
  }
  else if(sceneRadialCode != null){
    sceneRadialCode.update();
    if(sceneRadialCode != null) sceneRadialCode.draw(); 
  }
  else if(sceneRadialVisualizer != null){
    sceneRadialVisualizer.update();
    if(sceneRadialVisualizer != null) sceneRadialVisualizer.draw(); 
  }
  else if(sceneAABBAnimation != null){
    sceneAABBAnimation.update();
    if(sceneAABBAnimation != null) sceneAABBAnimation.draw(); 
  }
  else if(sceneAABBCode != null){
    sceneAABBCode.update();
    if(sceneAABBCode != null) sceneAABBCode.draw(); 
  }
  else if(sceneAABBVisualizer != null){
    sceneAABBVisualizer.update();
    if(sceneAABBVisualizer != null) sceneAABBVisualizer.draw(); 
  }
  
}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

void switchToTitle(){                      
  sceneTitle = new SceneTitle();
  sceneFinish = null;
  sceneRadialAnimation = null;
  sceneRadialCode = null;
  sceneRadialVisualizer = null;
  sceneAABBAnimation = null;
  sceneAABBCode = null;
  sceneAABBVisualizer = null;
}

void switchToFinish(){ 
  sceneFinish = new SceneFinish();
  sceneTitle = null;
  sceneRadialAnimation = null;
  sceneRadialCode = null;
  sceneRadialVisualizer = null;
  sceneAABBAnimation = null;
  sceneAABBCode = null;
  sceneAABBVisualizer = null;
}

void switchToRadialAnimation(){
  sceneRadialAnimation = new SceneRadialAnimation();
  sceneTitle = null;
  sceneFinish = null;
  sceneRadialCode = null;
  sceneRadialVisualizer = null;
  sceneAABBAnimation = null;
  sceneAABBCode = null;
  sceneAABBVisualizer = null;
}

void switchToRadialCode(){         
  sceneRadialCode = new SceneRadialCode();
  sceneTitle = null;
  sceneFinish = null;
  sceneRadialAnimation = null;
  sceneRadialVisualizer = null;
  sceneAABBAnimation = null;
  sceneAABBCode = null;
  sceneAABBVisualizer = null;
}

void switchToRadialVisualizer(){                      
  sceneRadialVisualizer = new SceneRadialVisualizer();
  sceneTitle = null;
  sceneFinish = null;
  sceneRadialCode = null;
  sceneRadialAnimation = null;
  sceneAABBAnimation = null;
  sceneAABBCode = null;
  sceneAABBVisualizer = null;
}

void switchToAABBAnimation(){                      
  sceneAABBAnimation = new SceneAABBAnimation();
  sceneTitle = null;
  sceneFinish = null;
  sceneRadialCode = null;
  sceneRadialVisualizer = null;
  sceneRadialAnimation = null;
  sceneAABBCode = null;
  sceneAABBVisualizer = null;
}

void switchToAABBCode(){                      
  sceneAABBCode = new SceneAABBCode();
  sceneTitle = null;
  sceneFinish = null;
  sceneRadialCode = null;
  sceneRadialVisualizer = null;
  sceneRadialAnimation = null;
  sceneAABBAnimation = null;
  sceneAABBVisualizer = null;
}

void switchToAABBVisualizer(){                      
  sceneAABBVisualizer = new SceneAABBVisualizer();
  sceneTitle = null;
  sceneFinish = null;
  sceneRadialCode = null;
  sceneRadialVisualizer = null;
  sceneRadialAnimation = null;
  sceneAABBAnimation = null;
  sceneAABBCode = null;
}
