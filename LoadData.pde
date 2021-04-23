 
Area[] area = new Area [52]; // der laves 1 array med 52 værdier
State[] state = new State [52]; // der laves 1 array med 52 værdier
Button b1 = new Button(1720, 100, 180, 200, "Sort by size", (255));

Table table;

int counter;
int doneAt = 1000;

void setup(){
  fullScreen();
  //rectMode(CENTER);
  textAlign(LEFT, CENTER);
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv","header");
  //getData();
  thread("getData");
  thread("loading");
  
}

void draw(){
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

void loading(){
  while(counter < doneAt){
    counter++;
    delay(1000);
  }
}

void mousePressed(){
  b1.registerPress();
}
