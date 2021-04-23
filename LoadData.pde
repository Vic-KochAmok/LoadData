 
Area[] area = new Area [52]; // der laves 1 array med 52 værdier
State[] state = new State [52]; // der laves 1 array med 52 værdier
Button b1 = new Button(1720, 100, 180, 200, "Sort by size", (255));

Table table;

int counterTime;
int loadingTime = 100;

void setup(){
  fullScreen();
  thread("loading");
  //rectMode(CENTER);
  textAlign(LEFT, CENTER);
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv","header");
  //getData();
  thread("getData");
  thread("loading");
}

void loading(){
  while(counterTime < loadingTime){
    counterTime++;
    delay(loadingTime);
  }
}

void draw(){
  if (counterTime < loadingTime){
  background(0);
  fill(255);
  textSize(200);
  text("Loading " + counterTime + "%", 400 , 400);
  rect(415,550,counterTime*8,50);
  } else {
  clear();
  b1.display();
  getData();
  for(State b: state){
    b.display();
  }
  for(Area b: area){
    b.display();
  }
 }
}  


void getData(){
  int yLevel = 10;
  int numb = 0;
  for(TableRow r: table.rows()){
    String s = r.getString("state");
    state [numb] = new State (10, yLevel, s);
    
    int i = r.getInt("area (sq. mi)");

    area[numb] = new Area (yLevel, i);
    yLevel += 20;
    numb++;
  }
}

void mousePressed(){
  b1.registerPress();
}
