class Button {
  float x, y, w, h;
  String label;
  color buttonColor, hoverColor;
  boolean isHovered = false;
  
  // Constructor
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.buttonColor = color(100, 150, 255);
    this.hoverColor = color(150, 200, 255);
  }
  
  // Display the button
  void display() {
    // Check if the mouse is hovering over the button
    if (isHovered) {
      fill(hoverColor);
    } else {
      fill(buttonColor);
    }
    
    // Draw the button
    rect(x, y, w, h);
    
    // Display the label in the center of the button
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x + w / 2, y + h / 2);
  }
  
  // Check if the button is pressed
  boolean isPressed() {
    return isHovered && mousePressed;
  }
  
  // Update hover status based on mouse position
  void update() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      isHovered = true;
    } else {
      isHovered = false;
    }
  }
}
