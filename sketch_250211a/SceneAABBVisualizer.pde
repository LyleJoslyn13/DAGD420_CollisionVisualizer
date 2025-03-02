class SceneAABBVisualizer {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  AABB Object1 = new AABB();
  AABB Object2 = new AABB();
  
  float Object1H = 100;
  float Object1W = 100;
  float Object2H = 100;
  float Object2W = 100;
  
  Slider Object1HeightSlider = new Slider(Object1H, 600, 540, 300, 30,50,150, "Object 1 Height");
  Slider Object1WidthSlider = new Slider(Object1W, 600, 620, 300, 30,50,150, "Object 1 Width");
  Slider Object2HeightSlider = new Slider(Object2H, 600, 690, 300, 30,50,150, "Object 2 Height");
  Slider Object2WidthSlider = new Slider(Object2W, 600, 760, 300, 30,50,150, "Object 2 Width");
  
  float Timer = 0;
  boolean isTimed = false;
  boolean isObjectSelected = false;
  
  boolean isInitialized = false;
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
    
     //println(Object1.edgeL);
    
    if (Object1.edgeR < Object1W){
      Object1.isXBarrierLeft = true;
      Object1.x = Object1W/2;
      //println("Left Collision");
    }
    if (Object1.edgeL > width - Object1W){
      Object1.isXBarrierRight = true;
      Object1.x = width-Object1W/2;
      //println("Right Collision");
    }
    if (Object1.edgeB < Object1H){
      Object1.isYBarrierTop = true;
      Object1.y = 0+Object1H/2;
      //println("Top Collision");
    }
    if (Object1.edgeT > (height/2)-Object1H){
      Object1.isYBarrierBottom = true;
      Object1.y = height/2-Object1H/2;
      //println("Bottom Collision"); 
    }
    if(mouseY < height/2-Object1H){
      Object1.isYBarrierBottom = false; 
    }
    if(mouseY > Object1H){
      Object1.isYBarrierTop = false; 
    }
    if(mouseX < width-Object1W){
      Object1.isXBarrierRight = false;
    }
    if(mouseX > Object1W){
      Object1.isXBarrierLeft = false;
    }
    
    if (Object2.edgeR < Object2W){
      Object2.isXBarrierLeft = true;
      Object2.x = Object2W/2;
      //println("Left Collision");
    }
    if (Object2.edgeL > width - Object2W){
      Object2.isXBarrierRight = true;
      Object2.x = width-Object2W/2;
      //println("Right Collision");
    }
    if (Object2.edgeB < Object2H){
      Object2.isYBarrierTop = true;
      Object2.y = Object2H/2;
      //println("Top Collision");
    }
    if (Object2.edgeT > (height/2)-Object2H){
      Object2.isYBarrierBottom = true;
      Object2.y = height/2-Object2H/2;
      //println("Bottom Collision"); 
    }
    if(mouseY < 500-Object2H){
      Object2.isYBarrierBottom = false; 
    }
    if(mouseY > Object2H){
      Object2.isYBarrierTop = false; 
    }
    if(mouseX < width-Object2W){
      Object2.isXBarrierRight = false;
    }
    if(mouseX > Object2W){
      Object2.isXBarrierLeft = false;
    }
    
    ////println(Object1.edgeT);
    //if(Object1.edgeT <= height/2-Object1H + 5 && Object1.edgeB >= Object1H && Object1.isYBarrierBottom){
    //  Object1.isYBarrierBottom = false;
    //  println("Movement is Free");
    //}
    
    if(!isInitialized){
      Object1.x = 400;
      Object1.y = 250;
      Object2.x = 600;
      Object2.y = 250;
      isInitialized = true;
      println("RUNNING");
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
    text("the Objects Width / Height", 250,585);
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
    

    LastButton.update(); // Update hover state
    NextButton.update();
    Object1.update();
    Object2.update();
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    Object1HeightSlider.draw();
    Object1WidthSlider.draw();
    Object2HeightSlider.draw();
    Object2WidthSlider.draw();
    Object1.draw();
    Object2.draw();
    
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
    if (LastButton.isPressed()&& isTimed && !isObjectSelected) {
      switchToAABBCode();
    }
    
    if (NextButton.isPressed()&& isTimed && !isObjectSelected) {
      switchToFinish(); 
    }
    
    if(mousePressed){
      
     if(Object1.isMouseInside() && !Object2.isSelected && !Object1HeightSlider.isDragging && !Object1WidthSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       isObjectSelected = true;
       Object1.isSelected = true;
     }
     if(Object2.isMouseInside() && !Object1.isSelected && !Object1HeightSlider.isDragging && !Object1WidthSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       isObjectSelected = true;
       Object2.isSelected = true;
     }
     if(Object1HeightSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1WidthSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       isObjectSelected = true;
       Object1HeightSlider.isDragging = true;
     }
     if(Object1WidthSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1HeightSlider.isDragging && !Object2HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       isObjectSelected = true;
       Object1WidthSlider.isDragging = true;
     }
     if(Object2HeightSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1WidthSlider.isDragging && !Object1HeightSlider.isDragging && !Object2WidthSlider.isDragging){
       isObjectSelected = true;
       Object2HeightSlider.isDragging = true;
     }
     if(Object2WidthSlider.isHovered() && !Object1.isSelected && !Object2.isSelected && !Object1HeightSlider.isDragging && !Object2HeightSlider.isDragging && !Object1WidthSlider.isDragging){
       isObjectSelected = true;
       Object2WidthSlider.isDragging = true;
     }
    } else {
     Object1.isSelected = false;
     Object2.isSelected = false;
     Object1HeightSlider.isDragging = false;
     Object1WidthSlider.isDragging = false;
     Object2HeightSlider.isDragging = false;
     Object2WidthSlider.isDragging = false;
     isObjectSelected = false;
    }
    
   
  }
  
}
