class SceneAABBVisualizer {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  AABB Object1 = new AABB();
  AABB Object2 = new AABB();
  
  float Object1H = 100;
  float Object1W = 100;
  float Object2H = 100;
  float Object2W = 100;
  
  Slider Object1HeightSlider = new Slider(Object1H, 400, 300, 300, 50,50,150, "Object 1 Height");
  Slider Object1WidthSlider = new Slider(Object1W, 400, 400, 300, 50,50,150, "Object 1 Width");
  Slider Object2HeightSlider = new Slider(Object2H, 400, 500, 300, 50,50,150, "Object 2 Height");
  Slider Object2WidthSlider = new Slider(Object2W, 400, 600, 300, 50,50,150, "Object 2 Width");
  
  float Timer = 0;
  boolean isTimed = false;
  
  SceneAABBVisualizer() {
    Object1.setSize(Object1H,Object1W);
    Object1.x = 400;
    Object1.y = 250;
    Object1.velocity.x = 0;
    Object1.velocity.y = 0;
    
    Object2.setSize(Object2H,Object2W);
    Object2.x = 600;
    Object2.y = 250;
    Object2.velocity.x = 0;
    Object2.velocity.y = 0;
  }
  
  void update() {
    //println("Object 1 Bottom Edge: " + Object1.edgeB);
    //println("Object 2 Top Edge: " + Object2.edgeT);
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
    text("AABB Visualizer", width/2, height/2-60);
    
    LastButton.update(); // Update hover state
    NextButton.update();
    Object1.update();
    Object2.update();
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    Object1.draw();
    Object2.draw();
    Object1HeightSlider.draw();
    Object1WidthSlider.draw();
    Object2HeightSlider.draw();
    Object2WidthSlider.draw();
    
    Object1H = Object1HeightSlider.Value;
    Object1W = Object1WidthSlider.Value;
    Object2H = Object2HeightSlider.Value;
    Object2W = Object2WidthSlider.Value;
    
    
    
    Object1.setSize(Object1W,Object1H);
    Object2.setSize(Object2W,Object2H);
    
    if(Object1.checkCollision(Object2)){
      Object1.FillColor = color(0,255,0);
      Object2.FillColor = color(0,255,0);
    } else {
      Object1.FillColor = color(255,0,0);
      Object2.FillColor = color(255,0,0);
    }
    
    // Check if the button is pressed
    if (LastButton.isPressed()&& isTimed == true) {
      switchToAABBCode();
    }
    
    if (NextButton.isPressed()&& isTimed == true) {
      switchToFinish(); 
    }
    
    if(mousePressed){
     if(Object1.isMouseInside() && !Object2.isSelected && !Object1HeightSlider.isDragging && !Object1WidthSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       Object1.isSelected = true;
     }
     if(Object2.isMouseInside() && !Object1.isSelected && !Object1HeightSlider.isDragging && !Object1WidthSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       Object2.isSelected = true;
     }
     if(Object1HeightSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1WidthSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       Object1HeightSlider.isDragging = true;
     }
     if(Object1WidthSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1HeightSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       Object1WidthSlider.isDragging = true;
     }
     if(Object2HeightSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1WidthSlider.isDragging && !Object1HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       Object2HeightSlider.isDragging = true;
     }
     if(Object2WidthSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1HeightSlider.isDragging && !Object2HeightSlider.isDragging && !Object1WidthSlider.isDragging){
       Object2WidthSlider.isDragging = true;
     }
    } else {
     Object1.isSelected = false;
     Object2.isSelected = false;
     Object1HeightSlider.isDragging = false;
     Object1WidthSlider.isDragging = false;
     Object2HeightSlider.isDragging = false;
     Object2WidthSlider.isDragging = false;
    }
    
  }
  
}
