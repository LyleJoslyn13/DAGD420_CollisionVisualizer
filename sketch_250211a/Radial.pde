class Radial {  
  PVector position = new PVector();
  float radius = 50;
  
  PVector velocity = new PVector();
  color FillColor;
  boolean isSelected = false;
  
  boolean isXBarrierLeft = false;
  boolean isXBarrierRight = false;
  boolean isYBarrierTop = false;
  boolean isYBarrierBottom = false;
  
  Radial() {    // Declares a new function //
 
  }
  
  void update() { // Logical and Artithmetic updates happen in this function // 
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(isSelected) {
      if (mouseX != position.x){
        if(!isXBarrierLeft && !isXBarrierRight){
          position.x = mouseX;
        }
      }
      if(mouseY != position.y ) {
        if(!isYBarrierTop && !isYBarrierBottom){
          position.y = mouseY;
        }
      }
    }
  }
  
  void draw() { 
    fill(FillColor);
    circle(position.x, position.y, radius*2);
  }
  
  boolean checkCollision(Radial other) {  
    float dx = (other.position.x) - (position.x);
    float dy = (other.position.y) - (position.y);
    float dis = sqrt(dx * dx + dy * dy);
    if(dis <= radius + other.radius) return true;
    return false;
  }
  
  boolean isMouseInside() {
    float dx = mouseX - (position.x);
    float dy = mouseY - (position.y);
    float distance = sqrt(dx * dx + dy * dy);
    return distance <= radius;
  }

}
