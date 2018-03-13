SugarGrid myGrid;
void setup(){
  SquareTester s = new SquareTester();
  s.test();
  
  GrowBackRuleTester gr = new GrowBackRuleTester();
  gr.test();
  
  SugarGridTester g = new SugarGridTester();
  g.test();
  
  MovementRuleTest m = new MovementRuleTest();
  m.test();
  
  AgentTester a = new AgentTester();
  a.test();

  size(1000,800);
  myGrid = new SugarGrid(50,40,20, new GrowBackRule(0));
  myGrid.addSugarBlob(0,0,2,8);
  myGrid.addSugarBlob(25,20,2,8);
  Agent ag = new Agent(1,1,10, new MovementRule());
  Agent age = new Agent(1,1,10, new MovementRule());
  Agent agen = new Agent(1,1000,10, new MovementRule());
  myGrid.placeAgent(ag,0,0);
  myGrid.placeAgent(age,7,9);
  myGrid.placeAgent(agen,9,3);
  myGrid.display();
  frameRate(100);

}

void draw(){
  myGrid.update();
  background(255);
  myGrid.display();
}