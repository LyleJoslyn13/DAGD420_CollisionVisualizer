class Slider {
  PVector Position = new PVector();
  
  float Value;  // The value that the slider will control
  float Min;      
  float Max;    
  float Width;  
  float Height;  
  boolean isDragging = false; 
  String Object;
  float knobX;
  
  Slider(float value, float x, float y, float w, float h, float min, float max, String object) {
    Value = value;
    Position.x = x;
    Position.y = y;
    Width = w;
    Height = h;
    Min = min;
    Max = max;
    Object = object;
  }
  
  void setup() {
    
  }
  
  void draw() {
    //Background of slider
    fill(200);
    rect(Position.x, Position.y + Height / 3, Width, Height / 4);
    
    // Draw the Knob on the Slider
    knobX = map(Value, Min, Max, Position.x, Position.x + Width);
    fill(0);
    ellipse(knobX, Position.y + Height / 2, Height, Height);
    
    textSize(16);
    text(Object + " Radius: " + int(Value), Position.x + Width/4, Position.y + Height + 20);
    
    if(isDragging){
      Value = map(mouseX, Position.x, Position.x + Width, Min, Max);
      Value = constrain(Value, Min, Max);  // Constrain the value within the slider's range
    }
    
  }
  
  boolean isHovered(){
    return dist(mouseX, mouseY, knobX, Position.y + Height / 2) < 10; 
  }
  
}

 
