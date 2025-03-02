class SceneRadialCode {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  float Timer = 0;
  boolean isTimed = false;
  
  PImage Code1;
  PImage Code2;
  PImage Code3;
  
  SceneRadialCode() {
    
    Code1 = loadImage("Images/RadialCode1.PNG");
    Code2 = loadImage("Images/RadialCode2.PNG");
    Code3 = loadImage("Images/RadialCode3.PNG");
    
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
    textAlign(CENTER, CENTER);
    
    image(Code1,250,500);
    textSize(25);
    text("used to CheckCollision() between this Radial Object and another",500,700);
    text("Effectively is the Pythagorean Theorem in Processing Code",500,750);
    
    image(Code2,300,100);
    text("Variables of Class AABB",500,200);
    
    image(Code3,250,300);
    text("Draw Function",500,400);
    
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
