SugarGrid myGrid;
ArrayList<Graph> listOfGraphs;
AgentFactory fac;

//ArrayList<Agent> d;
void setup(){

  size(1000,800);
  
  fac = new AgentFactory(1, 10, 1, 10, 5, 50, new SugarSeekingMovementRule());
  listOfGraphs = new ArrayList<Graph>();
  listOfGraphs.add(new NumberOfAgentsGraph(650,100, 300,200, "Time", "Number Of Agents"));
  listOfGraphs.add(new VisionGraph(650, 400, 300, 200, "Time", "Avg Vision"));
  
  myGrid = new SugarGrid(30,40,20, new SeasonalGrowbackRule(3, 0, 100, 20, 50*40));
  myGrid.addSugarBlob(15,20,1,4);
  
  for(int i = 0; i < 100; i++){
    myGrid.addAgentAtRandom(fac.makeAgent());
  }
  myGrid.display();
  frameRate(10);
}

void draw(){
  myGrid.update();
  //background(255);
  myGrid.display();
  for(int i = 0; i < listOfGraphs.size(); i++){
    listOfGraphs.get(i).update(myGrid);
  }
}