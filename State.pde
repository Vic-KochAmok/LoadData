class State{
  // data
  String txt;
  float x = 50;
  float y;
  
  // konstruktør
  State (float _x, float _y, String _txt){
    x = _x;
    y = _y;
    txt = _txt;
  }
  
  void display(){
    textSize(15);
    text(txt , x, y+5);
  }
}
