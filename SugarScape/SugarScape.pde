SugarGrid myGrid;
Graph NumberOfAgentsGraph;

void setup(){
  size(1200,700);
  
  int numOfAgents = 400;
  int minMetabolism = 1;
  int maxMetabolism = 4;
  int minVision = 1;
  int maxVision = 6;
  int minInitialSugar = 50;
  int maxInitialSugar = 100;
  
  MovementRule mr = new SugarSeekingMovementRule();
  
  GrowBackRule gbr = new GrowBackRule(1);
  
  NumberOfAgentsGraph = new NumberOfAgentsGraph(750, 100, 400, 200, "Time", "Agents");
  
  AgentFactory af = new AgentFactory(minMetabolism, maxMetabolism, minVision, maxVision, minInitialSugar, maxInitialSugar, mr);
  
  myGrid = new SugarGrid(50,50,14, gbr);
  myGrid.addSugarBlob(34, 15, 5, 5);
  myGrid.addSugarBlob(15, 34, 5, 5);
  for (int i = 0; i < numOfAgents; i++) {
    Agent a = af.makeAgent();
    myGrid.addAgentAtRandom(a);
  }
  myGrid.display();
  frameRate(200);
}

void draw(){
  myGrid.update();
  NumberOfAgentsGraph.update(myGrid);
  myGrid.display();
}