import java.util.LinkedList;

class SquareTester {
  void test() {
    Square s = new Square(5, 9, 50, 50); // square with sugarLevel 5, maxSugarLevel 9, position (x, y) = (50, 50)
    assert (s.getSugar() <= s.getMaxSugar());
    assert (s.getSugar() == 5);
    assert (s.getMaxSugar() == 9);
    
    for (int i = 0; i < 9; i++){
      s.setSugar(i);
      assert(s.getSugar() == i);
    }
    
    for (int i = 0; i < 6; i++){
      s.setSugar(-i);
      assert(s.getSugar() == 0);
    }
    
    for (int i = 0; i < 5; i++){
      s.setSugar(i + 9);
      assert(s.getSugar() == 9);
      assert(s.getMaxSugar() == 9);
    }
    
   //What's this trying to test
    for(int i = 0; i < 5; i++) {
      s.setMaxSugar(i + 9);
      assert(s.getSugar() == 9);
      assert(s.getMaxSugar()) == i + 9;
    }

    assert(s.getAgent() == null); 
    Agent a = new Agent(0,0,0, new MovementRule());
    s.setAgent(a);
    assert(s.getAgent() == a);
    s.setAgent(null);
    assert(s.getAgent() == null);

  }
}

class GrowBackRuleTester{
  void test(){
    GrowBackRule growB = new GrowBackRule(1);
    Square testSquare = new Square(5,10,0,0);
    growB.growBack(testSquare);
    assert(testSquare.getSugar() == 6);
    for(int counter = 0; counter < 10; counter++){
      growB.growBack(testSquare);
    }
    assert(testSquare.getSugar() == 10);
  }
}


class SugarGridTester {
  void test() {
    SugarGrid g = new SugarGrid(50, 40, 10, new GrowBackRule(1));
    assert(g.getWidth() == 50);
    assert(g.getHeight() == 40);
    assert(g.getSquareSize() == 10);
    
    for (int i = 0; i < 50; i++) {
      for (int j = 0; j < 40; j++) {
        assert(g.getSugarAt(i, j) == 0);
        assert(g.getMaxSugarAt(i, j) == 0);
        assert(g.getAgentAt(i, j) == null);
      }
    }
    
    Agent testAgent = new Agent(10,10,10, new MovementRule());
    g.placeAgent(testAgent, 0, 0);
    assert(g.getAgentAt(0,0) == testAgent);
    
    //Test this better
    
    assert(g.euclidianDistance(g.grid[2][39], g.grid[49][3]) == g.euclidianDistance(g.grid[49][39], g.grid[2][3]));
    assert(g.euclidianDistance(g.grid[49][3], g.grid[2][39]) == g.euclidianDistance(g.grid[49][39], g.grid[2][3]));
    
    
    //SugarBlob test
    
    //GenerateVision test
    
  }
}

class MovementRuleTest{
  void test(){
    SugarGrid g = new SugarGrid( 10, 10, 10,new GrowBackRule(0));
    LinkedList<Square> vision = new LinkedList<Square>();
    
    vision.add(new Square(1,10,3,3));
    vision.add(new Square(2,10,3,4));
    vision.add(new Square(3,10,3,2));
    vision.add(new Square(4,10,4,3));
    Square winner = new Square(5,10,2,3);
    vision.add(winner);
    
    MovementRule moveM = new MovementRule();
    assert(moveM.move(vision, g, new Square(0,0,5,5)) == winner);
  }
}


class AgentTester {
  void test(){
    MovementRule moveM = new MovementRule();
    Agent a = new Agent(5 , 5, 100, moveM);
    
    assert(a.getMetabolism() == 5);
    assert(a.getVision() == 5);
    assert(a.getSugarLevel() == 100);
    assert(a.getMovementRule() == moveM);
    
    
    }
  }