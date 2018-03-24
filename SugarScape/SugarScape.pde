SugarGrid myGrid;
Graph g;
Sorter s;
AgentFactory fac;
ArrayList<Agent> d;
void setup(){

  size(1000,800);
  s = new InsertionSorter();
  fac = new AgentFactory(1, 10, 1, 4, 5, 50, new SugarSeekingMovementRule());
  g = new NumberOfAgentsGraph(100,100, 200,200, "xlab", "ylab");
  myGrid = new SugarGrid(50,40,20, new SeasonalGrowbackRule(3, 0, 100, 20, 50*40));
  d = new ArrayList<Agent>();
  myGrid.addSugarBlob(25,20,3,8);
  myGrid.addSugarBlob(0,0,2,4);
  for(int i = 0; i < 10; i++){
    myGrid.addAgentAtRandom(fac.makeAgent());
    d.add(fac.makeAgent());
  }
  for(int i = 0; i < d.size(); i++){
    print(d.get(i).getSugarLevel() + ", ");
  }
  s.sort(d);
  println();
  for(int i = 0; i < d.size(); i++){
    print(d.get(i).getSugarLevel() + ", ");
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