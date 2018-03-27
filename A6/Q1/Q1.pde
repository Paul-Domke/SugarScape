SugarGrid myGrid;
Graph g;
//ArrayList<Agent> d;
void setup(){

  size(1000,800);
  
  g = new Graph(300,200,500,400,"Xlab", "Ylab");
  myGrid = new SugarGrid(30,40,20, new SeasonalGrowbackRule(3, 0, 100, 20, 50*40));

  myGrid.display();
  
  frameRate(10);
}

void draw(){
  myGrid.update();
  background(255);
  myGrid.display();
  g.update(myGrid);
}