class SceneAABBCode{
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  float Timer = 0;
  boolean isTimed = false;
  
  PImage Code1;
  PImage Code2;
  PImage Code3;
  
  SceneAABBCode() {
    
    Code1 = loadImage("Images/AABBCode1.PNG");
    Code2 = loadImage("Images/AABBCode2.PNG");
    Code3 = loadImage("Images/AABBCode3.PNG");
    
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
    
    image(Code1,10,10);
    textSize(25);
    text("Variables of Class AABB",150,250);
    
    image(Code2,600,10);
    textSize(25);
    text("Draw Function",800,100);
    
    image(Code3,10,300);
    textSize(25);
    text("setSize() is ran on start and whenever the objects size changes",550,400);
    
    text("calcAABB() is ran on Tick",400,550);
    
    text("used to CheckCollision() between",700,675);
    text("this AABB Object and another",700,700);
    
    LastButton.update(); // Update hover state
    NextButton.update();
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    
    // Check if the button is pressed
    if (LastButton.isPressed()&& isTimed == true) {
      switchToAABBAnimation();
    }
    
    if (NextButton.isPressed()&& isTimed == true) {
      println("Button Pressed");
      switchToAABBVisualizer(); 
    }
    
  }
  
}
