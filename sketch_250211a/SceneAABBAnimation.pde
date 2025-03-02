class SceneAABBAnimation {
  
  Button LastButton = new Button(0, 850, 500, 150, "Last Slide");
  Button NextButton = new Button(500, 850, 500, 150, "Next Slide");
  
  AABB Object1 = new AABB();
  AABB Object2 = new AABB();
  
  AABB Object3 = new AABB();
  AABB Object4 = new AABB();
  
  float Timer = 0;
  boolean isTimed = false;
  
  int SlideCount = 1;
  
  SceneAABBAnimation() {
    Object1.setSize(75,75);
    Object1.x = 600;
    Object1.y = 250;
    Object1.velocity.x = 100;
    Object1.velocity.y = 0;
    
    Object2.setSize(75,75);
    Object2.x = 800;
    Object2.y = 250;
    Object2.velocity.x = -100;
    Object2.velocity.y = 0;
    
    Object3.setSize(75,75);
    Object3.x = 250;
    Object3.y = 100;
    Object3.velocity.x = 0;
    Object3.velocity.y = 100;
    
    Object4.setSize(75,75);
    Object4.x = 250;
    Object4.y = 400;
    Object4.velocity.x = 0;
    Object4.velocity.y = -100;
  }
  
  void update() {

  }
  
  void draw() {
    Timer += dt;
    
    if(Timer >= 1.0) {
       isTimed = true;
    }
    
    if(Object1.x >= 725){
      Object1.velocity.x = -100; 
    }
    if(Object1.x <= 600){
      Object1.velocity.x = 100; 
    }
    if(Object2.x >= 800){
      Object2.velocity.x = -100; 
    }
    if(Object2.x <= 700){
      Object2.velocity.x = 100; 
    }
    
    if(Object3.y >= 300){
      Object3.velocity.y = -100; 
    }
    if(Object3.y <= 100){
      Object3.velocity.y = 100; 
    }
    if(Object4.y >= 400){
      Object4.velocity.y = -100; 
    }
    if(Object4.y <= 250){
      Object4.velocity.y = 100; 
    }
    
    background(255);
    textSize(35);
    textAlign(CENTER, CENTER);
    
    fill(220);
    rect(0,500,width,350);
    
    fill(0);
    if(SlideCount == 1) {
      text("Welcome to the AABB Visualizer!", width/2, height/2+60);
      text("Within this Visualizer you will learn how AABB Collision", width/2, height/2+120);
      text("works and how you can implement it in your projects", width/2, height/2+160);
      text("As you can see in the animation above:", width/2, height/2+220);
      text("The Objects are moving into and out of eachother,", width/2, height/2+260);
      text("changing colors when they overlap or Collide", width/2, height/2+300);
    }
    if(SlideCount == 2) {
      text("These Objects are Squares which mean there are 4 important", width/2, height/2+60);
      text("Variables used to calculate if Collision is Happening:", width/2, height/2+100);
      text("X Position, Y Position, Width & Height", width/2, height/2+170);
      text("We use the X & Y Positions, and get half of both Width & Height", width/2, height/2+240);
      text("to calculate where the Edges of the squares are.", width/2, height/2+280);
      
    }
    if(SlideCount == 3) {
      text("For Example:", width/2, height/2+60);
      text("We can calculate the position of the left edge by", width/2, height/2+120);
      text("taking the X Position and subtracting it by half the Width.", width/2, height/2+160);
      text("or we can find the right edge by just adding instead.", width/2, height/2+200);
      text("Then just swap in Y and Height to find the Top & Bottom Edge", width/2, height/2+260);
    }
    if(SlideCount == 4) {
      text("Now with all 4 edges we can compare it to another AABB", width/2, height/2+60);
      text("Objects Edges to see if they are overlapping or colliding", width/2, height/2+100);
      text("If one objects Right Edge is More than another objects Left Edge:", width/2, height/2+160);
      text("Then the objects are overlapping.", width/2, height/2+200);
      textSize(30);
      text("The Trick here is you have to compare every edge of the shape, to the", width/2, height/2+260);
      text("other objects edges, and if any of them are true, Collision is Happening", width/2, height/2+300);
    }
    
    LastButton.update(); 
    NextButton.update();
    Object1.update();
    Object2.update();
    Object3.update();
    Object4.update();
    
    LastButton.display(); 
    NextButton.display();
    Object1.draw();
    Object2.draw();
    Object3.draw();
    Object4.draw();
    
    // Check if the button is pressed
    if(LastButton.isPressed()&& isTimed == true) {
      if(SlideCount > 1){
        SlideCount--; 
      } else {
        switchToTitle();
      }
    }
    
    if(NextButton.isPressed()&& isTimed == true) {
      if(SlideCount == 4){
        SlideCount = 1;
        switchToAABBCode();
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
