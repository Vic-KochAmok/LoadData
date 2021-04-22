Area[] area = new Area [52]; // der laves 52 arrays
Table table;

void setup(){
  size(1600,900);
  
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv","header");
  //getData();
  thread("getData");
  
}

void draw(){
  f();
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
  int yLevel = 0;
  for(int i =0; i < 52; i++){
    area [i] = new Area (yLevel, 80);
    yLevel += 17;
  }
}
