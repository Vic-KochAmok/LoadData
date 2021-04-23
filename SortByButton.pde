class Button{
  float x,y,w,h;
  color strokeColor;
  String text;
  
  Button(float _x, float _y, float _w, float _h, String _text, color _strokeColor){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = _text;
    strokeColor = _strokeColor;
  }
  
  void display(){
    push();
      textAlign(CENTER, CENTER);
      stroke(strokeColor);
      fill(255);
      rect(x,y,w,h);
      fill(0);
      textSize(24);
      text(text, x+90,y+75);
    pop();
  }
  void registerPress() {
    if (mouseX > x && mouseX < x + w) {
      if (mouseY > y && mouseY < y + h) {
        println("fdregkæs juhbijgdhubnuitbntiu");
      }
    }
  }
}
