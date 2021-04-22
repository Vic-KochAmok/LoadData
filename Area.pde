class Area{
  // data
  float x = 20;
  float y;
  int a;
  
  //konstruktør
  Area (float _y, int _a){
    y = _y;
    a = _a;
  }
  
  void display(){
    rect (x, y, a, 15);
  }
}
