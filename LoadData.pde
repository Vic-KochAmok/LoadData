Area[] area = new Area [52]; 
State[] state = new State [52]; 
Button sortBtn = new Button(1720, 400, 170, 100, "Sort by size", "Sort alphabetically", 255, 17);
Button convertBtn = new Button(1720, 525, 170, 100, "Show in sq. km", "Show in sq. mi", 255, 17);
Loading loading = new Loading();

Table table;
Table sortedTable;
boolean pointer = false;

void setup() {
  fullScreen();
  textAlign(LEFT, CENTER);

  //Set table to table from cvs file
  table=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv", "header");
  sortedTable=loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv", "header");
  sortedTable.setColumnType(1, Table.INT);
}



void draw() {
  clear();
  //Fake loading 
  if (loading.isLoading == true) {
    loading.display();
    loading.load();
  } else { //After loading

    //Sorting button
    sortBtn.display();
    sortBtn.pointer();

    //Converting button
    convertBtn.display();
    convertBtn.pointer();

    //Get data from cvs file
    getData();

    //Display all state names and area squares
    for (State c : state)c.display();
    for (Area c : area) c.display();
  }

  //Cursor hand on button 
  if (pointer)cursor(HAND);
  if (!pointer)cursor(ARROW);
}  

void getData() {
  //Is the height between the states and sizes
  int yLevel = 10;

  //The reached row
  int numb = 0;

  if (!sortBtn.isActive) {
    for (TableRow row : table.rows()) {
      //Gets String and int from cvs
      String stateName = row.getString("state");
      int squareMiles = row.getInt("area (sq. mi)");
      if (convertBtn.isActive) {
        squareMiles = int(squareMiles /0.38610);
        state[numb] = new State (10, yLevel, stateName);
        area[numb] = new Area (yLevel, squareMiles, false);
      }
      if (!convertBtn.isActive) {
        state[numb] = new State (10, yLevel, stateName);
        area[numb] = new Area (yLevel, squareMiles, true);
      }
      yLevel += 20;
      numb++;
    }
  }
  if (sortBtn.isActive) {
    //Sorts the "sq. mi" column by size
    sortedTable.sortReverse("area (sq. mi)");
    for (TableRow row : sortedTable.rows()) {
      String stateName = row.getString("state");
      int squareMiles = row.getInt("area (sq. mi)");
      if (convertBtn.isActive) {
        squareMiles = int(squareMiles /0.38610);
        state[numb] = new State (10, yLevel, stateName);
        area[numb] = new Area (yLevel, squareMiles, false);
      }
      if (!convertBtn.isActive) {
        state[numb] = new State (10, yLevel, stateName);
        area[numb] = new Area (yLevel, squareMiles, true);
      }
      yLevel += 20;
      numb++;
    }
  }
}

void mousePressed() {
  sortBtn.registerPress();
  convertBtn.registerPress();
}
