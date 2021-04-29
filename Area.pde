//The white box which is the size of sq. mi
class Area{
  float x = 240;
  float y;
  int areaLength;
  boolean isMiles;
  
  Area (float _y, int _areaLength, boolean _isMiles){
    y = _y;
    areaLength = _areaLength;
    isMiles = _isMiles;
  }
  
  void display(){
    if(isMiles){
    text(areaLength + " sq. mi", (areaLength)/500+x+10,y+5);
    }else{
    text(areaLength + " sq. km", (areaLength)/1294+x+10,y+5);
    }
    if(areaLength>100){
      if(isMiles){
        rect(x, y, areaLength/500, 15);
      }else{
        rect(x, y, areaLength/1294, 15);
      }
      
    }else{
      rect(x, y, 2, 15);
    }
  }
}
