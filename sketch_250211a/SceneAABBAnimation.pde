class SceneAABBAnimation {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  AABB Object1 = new AABB();
  AABB Object2 = new AABB();
  
  float Timer = 0;
  boolean isTimed = false;
  
  int SlideCount = 1;
  
  SceneAABBAnimation() {
    Object1.setSize(100,100);
    Object1.x = 400;
    Object1.y = 250;
    Object1.velocity.x = 100;
    Object1.velocity.y = 0;
    
    Object2.setSize(100,100);
    Object2.x = 600;
    Object2.y = 250;
    Object2.velocity.x = -100;
    Object2.velocity.y = 0;
  }
  
  void update() {
    
  }
  
  void draw() {
    Timer += dt;
    
    if(Timer >= 1.0) {
       isTimed = true;
    }
    
    if(Object1.x >= 525){
      Object1.velocity.x = -100; 
    }
    if(Object1.x <= 400){
      Object1.velocity.x = 100; 
    }
    if(Object2.x >= 600){
      Object2.velocity.x = -100; 
    }
    if(Object2.x <= 500){
      Object2.velocity.x = 100; 
    }
    
    background(255);
    fill(0);
    textSize(35);
    textAlign(CENTER, CENTER);
    if(SlideCount == 1) {
      text("AABB Animation 1", width/2, height/2-60);
    }
    if(SlideCount == 2) {
      text("AABB Animation 2", width/2, height/2-60);
    }
    if(SlideCount == 3) {
      text("AABB Animation 3", width/2, height/2-60);
    }
    if(SlideCount == 4) {
      text("AABB Animation 4", width/2, height/2-60);
    }
    
    LastButton.update(); 
    NextButton.update();
    Object1.update();
    Object2.update();
    
    LastButton.display(); 
    NextButton.display();
    Object1.draw();
    Object2.draw();
    
    // Check if the button is pressed
    if(LastButton.isPressed()&& isTimed == true) {
      if(SlideCount > 1){
        SlideCount--; 
      } else {
        switchToTitle();
      }
    }
    
    if(NextButton.isPressed()&& isTimed == true) {
      if(SlideCount == 4){
        SlideCount = 1;
        switchToAABBCode();
      } else {
        SlideCount++; 
      }
    }
    
    if(Object1.checkCollision(Object2)){
      Object1.FillColor = color(0,255,0);
      Object2.FillColor = color(0,255,0);
    } else {
      Object1.FillColor = color(255,0,0);
      Object2.FillColor = color(255,0,0);
    }
  }
  
}
