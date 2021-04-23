class Area{
  // data
  float x = 240;
  float y;
  int areaLength;
  
  // konstruktør
  Area (float _y, int _areaLength){
    y = _y;
    areaLength = _areaLength;
  }
  
  void display(){
    
    text(areaLength + " sq m", (areaLength)/500+x+10,y+5);
    if(areaLength>100){
      rect(x, y, areaLength/500, 15);
    }else{
      rect(x, y, 2, 15);
    }
    
  }
}
