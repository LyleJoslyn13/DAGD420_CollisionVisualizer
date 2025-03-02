class SceneRadialVisualizer {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  Radial Object1 = new Radial();
  Radial Object2 = new Radial();
  
  Slider Object1Slider = new Slider(Object1.radius, 550, 550, 400, 100,25,100, "Object 1");
  Slider Object2Slider = new Slider(Object2.radius, 550, 700, 400, 100,25,100, "Object 2");
  
  float Timer = 0;
  boolean isTimed = false;
  boolean isObjectSelected = false;
  
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
    if (Object1.position.x < Object1.radius){
      Object1.isXBarrierLeft = true;
      Object1.position.x = Object1.radius;
      //println("Left Collision");
    }
    if (Object1.position.x > width - Object1.radius){
      Object1.isXBarrierRight = true;
      Object1.position.x = width-Object1.radius;
      println("Right Collision");
    }
    if (Object1.position.y < Object1.radius){
      Object1.isYBarrierTop = true;
      Object1.position.y = Object1.radius;
      //println("Top Collision");
    }
    if (Object1.position.y > (height/2)-Object1.radius){
      Object1.isYBarrierBottom = true;
      Object1.position.y = height/2-Object1.radius;
      //println("Bottom Collision"); 
    }
    if(mouseY < height/2-Object1.radius){
      Object1.isYBarrierBottom = false; 
    }
    if(mouseY > Object1.radius){
      Object1.isYBarrierTop = false; 
    }
    if(mouseX < width-Object1.radius){
      Object1.isXBarrierRight = false;
    }
    if(mouseX > Object1.radius){
      Object1.isXBarrierLeft = false;
    }
    
    if (Object2.position.x < Object2.radius){
      Object2.isXBarrierLeft = true;
      Object2.position.x = Object2.radius;
      //println("Left Collision");
    }
    if (Object2.position.x > width - Object2.radius){
      Object2.isXBarrierRight = true;
      Object2.position.x = width-Object2.radius;
      //println("Right Collision");
    }
    if (Object2.position.y < Object2.radius){
      Object2.isYBarrierTop = true;
      Object2.position.y = Object2.radius;
      //println("Top Collision");
    }
    if (Object2.position.y > (height/2)-Object2.radius){
      Object2.isYBarrierBottom = true;
      Object2.position.y = height/2-Object2.radius;
      //println("Bottom Collision"); 
    }
    if(mouseY < height/2-Object2.radius){
      Object2.isYBarrierBottom = false; 
    }
    if(mouseY > Object2.radius){
      Object2.isYBarrierTop = false; 
    }
    if(mouseX < width-Object2.radius){
      Object2.isXBarrierRight = false;
    }
    if(mouseX > Object2.radius){
      Object2.isXBarrierLeft = false;
    }
   
   
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
    
    fill(220);
    rect(0,500,width/2,350);
    rect(width/2,500,width/2,350);
    
    fill(0);
    text("The Sliders can adjust" , 250, 550);
    text("the Objects Size / Diameter", 250,585);
    text("Click and Drag on an", 250, 650);
    text("Object to move it", 250, 685);
    fill(0,255,0);
    text("GREEN",170,740);
    fill(0);
    text("= Colliding", 305,740);
    fill(255,0,0);
    text("RED",140,800);
    fill(0);
    text("= Not Colliding", 285,800);
    
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
    if (LastButton.isPressed()&& isTimed == true && !isObjectSelected) {
      switchToRadialCode();
    }
    
    if (NextButton.isPressed()&& isTimed == true && !isObjectSelected) {
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
        isObjectSelected = true;
        Object1.isSelected = true;
      }
      if(Object2.isMouseInside() && !Object1.isSelected && !Object1Slider.isDragging && !Object2Slider.isDragging){
        isObjectSelected = true;
        Object2.isSelected = true; 
      }
      if(Object1Slider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object2Slider.isDragging){
        isObjectSelected = true;
         Object1Slider.isDragging = true;
      }
      if(Object2Slider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1Slider.isDragging){
        isObjectSelected = true;
         Object2Slider.isDragging = true;
      }
    } else {
      Object1.isSelected = false;
      Object2.isSelected = false;
      Object1Slider.isDragging = false;
      Object2Slider.isDragging = false;
      isObjectSelected = false;
    }
    
  }
  
} 
