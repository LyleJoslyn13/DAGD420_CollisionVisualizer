class SceneRadialVisualizer {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  Radial Object1 = new Radial();
  Radial Object2 = new Radial();
  
  Slider Object1Slider = new Slider(Object1.radius, 400, 400, 300, 50,25,100, "Object 1");
  Slider Object2Slider = new Slider(Object2.radius, 400, 600, 300, 50,25,100, "Object 2");
  
  float Timer = 0;
  boolean isTimed = false;
  
  SceneRadialVisualizer() {
    Object1.position.x = 400;
    Object1.position.y = 250;
    Object1.velocity.x = 0;
    Object1.velocity.y = 0;
    Object1.FillColor = color(255,0,0);
    
    Object2.position.x = 600;
    Object2.position.y = 250;
    Object2.velocity.x = 0;
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
    
    background(255);
    fill(0);
    textSize(35);
    textAlign(CENTER, CENTER);
    text("Radial Visualizer", width/2, height/2-60);
    
    Object1.radius = Object1Slider.Value;
    Object2.radius = Object2Slider.Value;
    
    LastButton.update(); // Update hover state
    NextButton.update();
    Object1.update();
    Object2.update();
    
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    Object1.draw();
    Object2.draw();
    Object1Slider.draw();
    Object2Slider.draw();
    
    // Check if the button is pressed
    if (LastButton.isPressed()&& isTimed == true) {
      switchToRadialCode();
    }
    
    if (NextButton.isPressed()&& isTimed == true) {
      switchToFinish(); 
    }
    
    if(Object1.checkCollision(Object2)){
      Object1.FillColor = color(0,255,0);
      Object2.FillColor = color(0,255,0);
    } else {
      Object1.FillColor = color(255,0,0);
      Object2.FillColor = color(255,0,0);
    }
    
    //redesign new way.
    if(mousePressed){
      if(Object1.isMouseInside() && !Object2.isSelected && !Object1Slider.isDragging && !Object2Slider.isDragging) {
        Object1.isSelected = true;
      }
      if(Object2.isMouseInside() && !Object1.isSelected && !Object1Slider.isDragging && !Object2Slider.isDragging){
        Object2.isSelected = true; 
      }
      if(Object1Slider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object2Slider.isDragging){
         Object1Slider.isDragging = true;
      }
      if(Object2Slider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1Slider.isDragging){
         Object2Slider.isDragging = true;
      }
    } else {
      Object1.isSelected = false;
      Object2.isSelected = false;
      Object1Slider.isDragging = false;
      Object2Slider.isDragging = false;
    }
    
  }
  
} 
