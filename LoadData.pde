 
Table table;


void setup(){
  size(1200,800);
  
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv","header");
  getData();


}

void draw(){

}  


void getData(){
  for(TableRow r: table.rows()){
    String s = r.getString("state");
    //int i = r.getInt("area");
    
    println("state: " + s );
  }
}
