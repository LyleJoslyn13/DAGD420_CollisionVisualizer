// this class defines a "Title" scene
class SceneTitle {
  
  Button RadialButton = new Button(25, 700, 450, 150, "Radial Collision");
  Button AABBButton = new Button(525, 700, 450, 150, "AABB Collision");
  
  float Timer = 0;
  boolean isTimed = false;
  
  SceneTitle() {
    
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
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Collision", width/2, height/2-400);
    text("Visualizer", width/2, height/2-280);
    textSize(50);
    text("Made by:", width/2, height/2-150);
    textSize(60);
    text("Lyle Joslyn", width/2, height/2-90);
    
    RadialButton.update(); // Update hover state
    AABBButton.update();
    
    RadialButton.display(); // Draw button on the screen
    AABBButton.display();
    
    // Check if the button is pressed
    if (RadialButton.isPressed() && isTimed == true) {
      switchToRadialAnimation();
    }
    
    if (AABBButton.isPressed() && isTimed == true) {
      switchToAABBAnimation();
    }
  }
  
}
