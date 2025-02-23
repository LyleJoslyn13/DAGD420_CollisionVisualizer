class Button {
  
  float x, y, w, h;
  String label;
  color buttonColor, hoverColor;
  boolean isHovered = false;
  boolean wasPressedLastFrame = false;
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.buttonColor = color(155, 155, 155);
    this.hoverColor = color(105, 105, 105);
  }
  
  // Display the button
  void display() {
    // Check if the mouse is hovering over the button
    if (isHovered) {
      fill(hoverColor);
    } else {
      fill(buttonColor);
    }

    rect(x, y, w, h);
    
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    text(label, x + w / 2, y + h / 2);
  }
 
  boolean isPressed() {

    if (isHovered && mousePressed && !wasPressedLastFrame) {
      wasPressedLastFrame = true; 
      return true;
    }
    return false;
  }
  
  void update() {
    
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      isHovered = true;
    } else {
      isHovered = false;
    }
    
    if (!mousePressed) {
      wasPressedLastFrame = false;
    }
  }
}
