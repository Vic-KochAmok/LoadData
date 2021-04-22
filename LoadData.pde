Area[] area = new Area [52]; // der laves 1 array med 52 værdier
State[] state = new State [52]; // der laves 1 array med 52 værdier
Table table;
void setup(){
  size(1920,1080);
  rectMode(CENTER);
  textAlign(LEFT, CENTER);
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv","header");
  //getData();
  thread("getData");
  
}

void draw(){
  f();
  g();
  for(State b: state){
  b.display();
  }
  for(Area b: area){
    b.display();
  }
}  


void getData(){
  for(TableRow r: table.rows()){
    String s = r.getString("state");
    int i = r.getInt("area (sq. mi)");
    
    println("state: " + s + " area: " + i);
  }
}
void f(){
  int yLevel = 10;
  for(int i =0; i < 52; i++){
    area [i] = new Area (yLevel, 80);
    yLevel += 20;
  }
}

void g(){
  int yLevel = 10;
  for(int i =0; i < 52; i++){
    state [i] = new State (10, yLevel, "Alabama");
    yLevel += 20;
  }
}
