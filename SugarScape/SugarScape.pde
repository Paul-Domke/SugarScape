SugarGrid myGrid;
AgentFactory fac;
Graph g;
ArrayList<Agent> d;
Sorter s;
void setup(){

  size(1000,800);
  
  d = new ArrayList<Agent>();
  s = new QuickSorter();
  fac = new AgentFactory(1,2,1,2,1,10, new SugarSeekingMovementRule());
  g = new Graph(300,200,500,400,"Xlab", "Ylab");
  myGrid = new SugarGrid(30,40,20, new SeasonalGrowbackRule(3, 0, 100, 20, 50*40));
  for(int i = 0; i < 20; i++){
    d.add(fac.makeAgent());
  }
  for(int i = 0; i < d.size(); i++){
    print(d.get(i).getSugarLevel());
  }
  println();
  s.sort(d);
  for(int i = 0; i < d.size(); i++){
    print(d.get(i).getSugarLevel());
  }
  myGrid.display();
  
  frameRate(10);
}

void draw(){
  myGrid.update();
  background(255);
  myGrid.display();
  g.update(myGrid);
}