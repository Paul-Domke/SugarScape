SugarGrid myGrid;
void setup(){
  SquareTester s = new SquareTester();
  s.test();
  
  SugarGridTester g = new SugarGridTester();
  g.test();
  
  AgentTester a = new AgentTester();
  a.test();

  size(1000,800);
  myGrid = new SugarGrid(50,40,20, new GrowBackRule(0));
  myGrid.addSugarBlob(10,10,1,8);
  Agent ag = new Agent(1,1,10, new MovementRule());
  myGrid.placeAgent(ag,10,10);
  myGrid.display();
  frameRate(2);

}

void draw(){
  myGrid.update();
  background(255);
  myGrid.display();
}