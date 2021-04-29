//Fake loading because thread is too quick
class Loading {
  //Both counterTime and loadingTime is used to make it more realistic
  int counterTime;
  int loadingTime;
  boolean isLoading = true;
  
  Loading(){
  
  }

  void load() {
    //Loading time controls the delay between each increase
    loadingTime = int(random(100,200));
    if (counterTime <= 100) {
      
      //Increase in loading
      counterTime = counterTime + int(random(6,12));
      delay(loadingTime);
    }
    if(counterTime > 100){
      isLoading = false;
    }
  }
  
  void display(){
    background(0);
    fill(255);
    textSize(200);
    text("Loading " + counterTime + "%", 400 , 400);
    rect(415,550,counterTime*12,50);
  }
}
