// this class defines a "Title" scene
class SceneTitle {
  
  Button myButton = new Button(100, 100, 150, 50, "Click Me");
  
  SceneTitle() {
    
  }
  
  void update() {
    
  }
  
  void draw() {
    //ADJUST LATER --- VISUAL DESIGN !!!!!!!!!!!!!!
    background(0);
    fill(255);
    textSize(35);
    textAlign(CENTER, CENTER);
    text("Collision Visualizer", width/2, height/2-60);
    
    myButton.update(); // Update hover state
    myButton.display(); // Draw button on the screen
    
    // Check if the button is pressed
    if (myButton.isPressed()) {
      println("Button Pressed!");
    }
  }
  
}
