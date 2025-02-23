class Radial{  // Declares a new class //
  
  PVector position = new PVector(100,100);
  PVector velocity = new PVector(100, 0);
  float radius = 50;
  float angle;
  color FillColor;
  
  Radial() {    // Declares a new function //
 
  }
  
  void update() { // Logical and Artithmetic updates happen in this function // 
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
  }
  
  void draw() {   // Graphical updates happen in this function //
    fill(FillColor);
    circle(position.x - radius, position.y - radius, radius*2);
  }
  
  boolean checkCollision(Radial other) {       // pythagorean theorem in code  //
    float dx = other.position.x - position.x;
    float dy = other.position.y - position.y;
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
}
