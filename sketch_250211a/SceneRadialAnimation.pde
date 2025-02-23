class SceneRadialAnimation {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  Radial Object1 = new Radial();
  
  Radial Object2 = new Radial();
  
  float Timer = 0;
  boolean isTimed = false;
  
  int SlideCount = 1;
  
  SceneRadialAnimation() {
    Object1.position.x = 400;
    Object1.position.y = 250;
    Object1.velocity.x = 100;
    Object1.velocity.y = 0;
    Object1.FillColor = color(255,0,0);
    
    Object2.position.x = 600;
    Object2.position.y = 250;
    Object2.velocity.x = -100;
    Object2.velocity.y = 0;
    Object2.FillColor = color(255,0,0);
  }
  
  void update() {

  }
  
  void draw() {
    Timer += dt;
    
    if(Timer >= 1.0) {
       isTimed = true;
    }
    
    if(Object1.position.x >= 525){
      Object1.velocity.x = -100; 
    }
    if(Object1.position.x <= 400){
      Object1.velocity.x = 100; 
    }
    if(Object2.position.x >= 600){
      Object2.velocity.x = -100; 
    }
    if(Object2.position.x <= 500){
      Object2.velocity.x = 100; 
    }
    
    background(255);
    fill(0);
    textSize(35);
    textAlign(CENTER, CENTER);
   if(SlideCount == 1) {
      text("Radial Animation 1", width/2, height/2-60);
    }
    if(SlideCount == 2) {
      text("Radial Animation 2", width/2, height/2-60);
    }
    if(SlideCount == 3) {
      text("Radial Animation 3", width/2, height/2-60);
    }
    if(SlideCount == 4) {
      text("Radial Animation 4", width/2, height/2-60);
    }
    
    LastButton.update(); // Update hover state
    NextButton.update();
    Object1.update();
    Object2.update();
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    Object1.draw();
    Object2.draw();
    
    // Check if the button is pressed
    if (LastButton.isPressed()&& isTimed == true) {
      if(SlideCount > 1){
        SlideCount--; 
      } else {
        switchToTitle();
      }
    }
    
    if (NextButton.isPressed()&& isTimed == true) {
      if(SlideCount == 4){
        SlideCount = 1;
        switchToRadialCode();
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
