 
Area[] area = new Area [52]; // der laves 1 array med 52 værdier
State[] state = new State [52]; // der laves 1 array med 52 værdier
Table table;

int counter;
int doneAt = 1000;

void setup(){
  size(1920,1080);
  //rectMode(CENTER);
  textAlign(LEFT, CENTER);
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv","header");
  //getData();
  thread("getData");
  thread("loading");
  
}

void draw(){
  clear();
  makeAreas();
  makeStates();
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
    //String s = r.getString("state");
    int i = r.getInt("area (sq. mi)");
    //println("state: " + s + " area: " + i);

    area[numb] = new Area (yLevel, i);
    yLevel += 20;
    numb++;
  }
}
void makeAreas(){
  int yLevel = 10;
  for(int i =0; i < 52; i++){
    area [i] = new Area (yLevel, 80);
    yLevel += 20;
  }
}

void makeStates(){
  int yLevel = 10;
  for(int i =0; i < 52; i++){
    state [i] = new State (10, yLevel, "Alabama");
    yLevel += 20;
  }
}
void loading(){
  while(counter < doneAt){
    counter++;
    delay(1000);
  }
}
