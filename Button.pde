class Button{
  float x,y,w,h;
  color strokeColor;
  color originalStrokeColor;
  String inactiveText;
  String activeText;
  boolean isActive = false;
  int textSize;
  
  String displayedText;
  
  
  Button(float _x, float _y, float _w, float _h, String _inactiveText, String _activeText, color _strokeColor, int _textSize){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    inactiveText = _inactiveText;
    activeText = _activeText;
    strokeColor = _strokeColor;
    originalStrokeColor = _strokeColor;
    textSize = _textSize;
  }
  
  void display(){
    if(isActive){
      displayedText = activeText;
      strokeColor = color(255,0,0);
    }else{
      displayedText = inactiveText;
      strokeColor = originalStrokeColor;
    }
    
    push();
      textAlign(CENTER, CENTER);
      rectMode(CENTER);
      stroke(strokeColor);
      strokeWeight(3);
      fill(255);
      rect(x,y,w,h);
      fill(0);
      textSize(textSize);
      text(displayedText, x,y);
    pop();
  }
  
  
  void pointer(){
    //Makes cursor into a pointing cursor when in front of the box
    if(checkMousePos() == true){
      pointer = true;
    }
  }
  
  void registerPress() {
    //Sets button to active when clicked and in range
    if(checkMousePos() == true){
      isActive = !isActive;
    }
  }
  
  boolean checkMousePos(){
    if (mouseX > x-w*0.5 && mouseX < x + w*0.5) {
      if (mouseY > y-h*0.5 && mouseY < y + h*0.5) {
        return true;
      }
    }
    return false;
  }
}
