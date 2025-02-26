class Radial {  // Declares a new class //
  
  PVector position = new PVector();
  PVector velocity = new PVector();
  float radius = 50;
  float angle;
  color FillColor;
  boolean isSelected = false;
  
  Radial() {    // Declares a new function //
 
  }
  
  void update() { // Logical and Artithmetic updates happen in this function // 
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(isSelected) {
      if (mouseX != position.x || mouseY != position.y ) {
        position.x = mouseX;
        position.y = mouseY;
      }
    }
  }
  
  void draw() {   // Graphical updates happen in this function //
    fill(FillColor);
    circle(position.x, position.y, radius*2);
  }
  
  boolean checkCollision(Radial other) {       // pythagorean theorem in code  //
    float dx = (other.position.x) - (position.x);
    float dy = (other.position.y) - (position.y);
    float dis = sqrt(dx * dx + dy * dy);
    if(dis <= radius + other.radius) return true;
    return false;
    
  }
  
  void calcAngle(Radial other) {
    float dx = other.position.x - position.x;
    float dy = other.position.y - position.y;
    angle = atan2(dy, dx);
  }
  
  void calcAngle(float x, float y) {
    float dx = x - position.x;
    float dy = y - position.y;
    angle = atan2(dy, dx);
  }
  
  boolean isMouseInside() {
    float dx = mouseX - (position.x);
    float dy = mouseY - (position.y);
    float distance = sqrt(dx * dx + dy * dy);
    return distance <= radius;
  }

}
