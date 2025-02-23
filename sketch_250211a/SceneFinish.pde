class SceneFinish {
  
  Button AABBButton = new Button(50, 800, 400, 150, "AABB Visualizer");
  Button RadialButton = new Button(50, 600, 400, 150, "Radial Visualizer");
  Button TitleButton = new Button(550, 800, 400, 150, "Title Screen");
  Button QuitButton = new Button(550, 600, 400, 150, "Quit Screen");
  
  float Timer = 0;
  boolean isTimed = false;
  
  SceneFinish() {
    
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
    textSize(150);
    textAlign(CENTER, CENTER);
    text("Thank You!", width/2, 100);
    textSize(60);
    text("Please check out the other Visualizer", width/2, height/2-200);
    text("And good luck with your own", width/2, height/2-120);
    text("2D Collision Systems", width/2, height/2-40);
    
    AABBButton.update(); // Update hover state
    RadialButton.update();
    TitleButton.update(); 
    QuitButton.update();
    
    AABBButton.display(); // Draw button on the screen
    RadialButton.display();
    TitleButton.display(); 
    QuitButton.display();
    
    // Check if the button is pressed
    if (AABBButton.isPressed()&& isTimed == true) {
      switchToAABBAnimation(); 
    }
    
    if (RadialButton.isPressed()&& isTimed == true) {
      switchToRadialAnimation();
    }
    
    if (TitleButton.isPressed()&& isTimed == true) {
      switchToTitle();
    }
    
    if (QuitButton.isPressed()&& isTimed == true) {
      exit(); 
    }
    
  }
  
}
