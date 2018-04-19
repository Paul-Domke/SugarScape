SugarGrid myGrid;

void setup(){
  size(1000,800);
  
  myGrid = new SugarGrid(30,40,20, new SeasonalGrowbackRule(3, 0, 100, 20, 50*40));

  myGrid.display();
  
  frameRate(2);
}

void draw(){
  myGrid.update();
  background(255);
  myGrid.display();
}