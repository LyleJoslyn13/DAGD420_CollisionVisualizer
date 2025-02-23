class SceneRadialCode {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  float Timer = 0;
  boolean isTimed = false;
  
  SceneRadialCode() {
    
  }
  
  void update() {
    
  }
  
  void draw() {
    Timer += dt;
    
    if(Timer >= 1.0) {
       isTimed = true;
    }
    
    background(255);
    fill(0);
    textSize(35);
    textAlign(CENTER, CENTER);
    text("Radial Code", width/2, height/2-60);
    
    LastButton.update(); // Update hover state
    NextButton.update();
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    
    // Check if the button is pressed
    if (LastButton.isPressed()&& isTimed == true) {
      switchToRadialAnimation();
    }
    
    if (NextButton.isPressed()&& isTimed == true) {
      switchToRadialVisualizer(); 
    }
  }
  
}
