class SceneRadialAnimation {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  Radial Object1 = new Radial();
  Radial Object2 = new Radial();
  Radial Object3 = new Radial();
  Radial Object4 = new Radial();
  
  float Timer = 0;
  boolean isTimed = false;
  
  int SlideCount = 1;
  
  PImage DistanceImage;
  
  SceneRadialAnimation() {
    Object1.position.x = 600;
    Object1.position.y = 250;
    Object1.velocity.x = 100;
    Object1.velocity.y = 0;
    Object1.FillColor = color(255,0,0);
    
    Object2.position.x = 800;
    Object2.position.y = 250;
    Object2.velocity.x = -100;
    Object2.velocity.y = 0;
    Object2.FillColor = color(255,0,0);
    
    Object3.position.x = 250;
    Object3.position.y = 100;
    Object3.velocity.x = 0;
    Object3.velocity.y = 100;
    Object3.FillColor = color(255,0,0);
    
    Object4.position.x = 250;
    Object4.position.y = 400;
    Object4.velocity.x = 0;
    Object4.velocity.y = -100;
    Object4.FillColor = color(255,0,0);
    
    DistanceImage = loadImage("Images/Distance.PNG");
  }
  
  void update() {

  }
  
  void draw() {
    Timer += dt;
    
    if(Timer >= 1.0) {
       isTimed = true;
    }
    
    if(Object1.position.x >= 725){
      Object1.velocity.x = -100; 
    }
    if(Object1.position.x <= 600){
      Object1.velocity.x = 100; 
    }
    if(Object2.position.x >= 800){
      Object2.velocity.x = -100; 
    }
    if(Object2.position.x <= 700){
      Object2.velocity.x = 100; 
    }
    
    if(Object3.position.y >= 300){
      Object3.velocity.y = -100; 
    }
    if(Object3.position.y <= 100){
      Object3.velocity.y = 100; 
    }
    if(Object4.position.y >= 400){
      Object4.velocity.y = -100; 
    }
    if(Object4.position.y <= 250){
      Object4.velocity.y = 100; 
    }
    
    background(255);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(35);
    fill(220);
    rect(0,500,width,350);
    
    fill(0);
    if(SlideCount == 1) {
      text("Welcome to the Radial Visualizer!", width/2, height/2+60);
      text("Within this Visualizer you will learn how Radial Collision", width/2, height/2+120);
      text("works and how you can implement it in your projects", width/2, height/2+160);
      text("As you can see in the animation above:", width/2, height/2+220);
      text("The Objects are moving into and out of eachother,", width/2, height/2+260);
      text("changing colors when they overlap or Collide", width/2, height/2+300);
    }
    if(SlideCount == 2) {
      text("These Objects are Circles which mean there are 3 important", width/2, height/2+60);
      text("Variables used to calculate if Collision is Happening:", width/2, height/2+100);
      text("X Position, Y Position, & Radius", width/2, height/2+160);
      text("And we can use these Variables to determine the", width/2, height/2+220);
      text("Distance between 2 Radial Objects", width/2, height/2+260);
    }
    if(SlideCount == 3) {
      textSize(30);
      text("This Formula is used to find the distance Between 2 Radial Objects", width/2, height/2+180);
      text("By subtracting each objects X's and Y's, squareing the results, adding", width/2, height/2+240);
      text("them together, and then taking the square root will provide the Distance ", width/2, height/2+280);
      image(DistanceImage,130,510);
    }
    if(SlideCount == 4) {
      textSize(35);
      text("Once we have the distance between the 2 Objects:", width/2, height/2+180);
      text("We can add the radius's of each object together, and if the", width/2, height/2+240);
      text("distance is less than the Radius's, Collision is happening.  ", width/2, height/2+280);
      image(DistanceImage,130,510);
    }
    
    LastButton.update(); // Update hover state
    NextButton.update();
    Object1.update();
    Object2.update();
    Object3.update();
    Object4.update();
    
    LastButton.display(); // Draw button on the screen
    NextButton.display();
    Object1.draw();
    Object2.draw();
    Object3.draw();
    Object4.draw();
    
    // Check if the button is pressed
    if (LastButton.isPressed()&& isTimed == true) {
      if(SlideCount > 1){
        SlideCount--; 
      } else {
        switchToTitle();
      }
    }
    
    if (NextButton.isPressed()&& isTimed == true) {
      if(SlideCount == 4){
        SlideCount = 1;
        switchToRadialCode();
      } else {
        SlideCount++; 
      } 
    }
    
    if(Object1.checkCollision(Object2)){
      Object1.FillColor = color(0,255,0);
      Object2.FillColor = color(0,255,0);
    } else {
      Object1.FillColor = color(255,0,0);
      Object2.FillColor = color(255,0,0);
    }
    
    if(Object3.checkCollision(Object4)){
      Object3.FillColor = color(0,255,0);
      Object4.FillColor = color(0,255,0);
    } else {
      Object3.FillColor = color(255,0,0);
      Object4.FillColor = color(255,0,0);
    }
  
  }
  
}
