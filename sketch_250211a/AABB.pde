class AABB {
  float x, y, w, h;
  float halfW, halfH;
  float angle;

  float edgeL;
  float edgeR;
  float edgeT;
  float edgeB;
  
  boolean isXBarrierLeft = false;
  boolean isXBarrierRight = false;
  boolean isYBarrierTop = false;
  boolean isYBarrierBottom = false;

  PVector velocity = new PVector();
  
  color FillColor = color(255,0,0);
  
  boolean isSelected = false;

  AABB() {

  }

  void update() {
    x += velocity.x * dt;
    y += velocity.y * dt;
    
    if(isSelected) {
      if (mouseX != x || mouseY != y) {
        if(!isXBarrierLeft && !isXBarrierRight){
          x = mouseX;
        } 
        if(!isYBarrierBottom && !isYBarrierTop){
          y = mouseY;
        }
      }
    }
    
    calcAABB();
  }

  void draw() {
    fill(FillColor);
    rect(x - halfW,y-halfH,w,h);
    
    //circle(edgeR,edgeB,5);
    //circle(edgeR,edgeT,5);
    //circle(edgeL,edgeB,5);
    //circle(edgeL,edgeT,5);
    
    //circle(edgeR + halfW,edgeB + halfH,5);
    //circle(edgeR + halfW,edgeT + halfH,5);
    //circle(edgeL + halfW,edgeB + halfH,5);
    //circle(edgeL + halfW,edgeT + halfH,5);
  }

  void setSize(float w, float h) {
    this.w = w;
    this.h = h;
    halfW = w/2;
    halfH = h/2;
  }

  void calcAABB() {
    edgeL = x - halfW;
    edgeR = x + halfW;
    edgeT = y - halfH;
    edgeB = y + halfH;
  }

  boolean checkCollision(AABB other) {
    if (edgeR < other.edgeL) return false;
    if (edgeL > other.edgeR) return false;
    if (edgeB < other.edgeT) return false;
    if (edgeT > other.edgeB) return false;
    return true;
  }
  
  boolean isMouseInside() {
    if (mouseX > x-halfH && mouseX < x-halfW + w && mouseY > y-halfH && mouseY < y-halfH + h) {
      return true;
    } else {
      return false;
    }
  }
}
