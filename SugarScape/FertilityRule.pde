import java.util.Map;

class FertilityRule{
  Map<Character, Integer[]> childbearingOnset;
  Map<Character,Integer[]> climactericOnset;
  HashMap<Agent, Integer> initalSugar;
  HashMap<Agent, Integer> agentC;
  HashMap<Agent, Integer> agentO;
  
  public FertilityRule(Map<Character, Integer[]> childbearingOnset, Map<Character,Integer[]> climactericOnset){
    this.childbearingOnset = childbearingOnset;
    this.climactericOnset = climactericOnset;
    initalSugar = new HashMap<Agent, Integer>();
    agentC = new HashMap<Agent, Integer>();
    agentO = new HashMap<Agent, Integer>();
  }
  
  public boolean isFertile(Agent a){
    if(a == null){
      initalSugar.remove(a);
      agentC.remove(a);
      agentO.remove(a);
      return false;
    }
    if(!initalSugar.containsKey(a)){
      float randC = random(0, childbearingOnset.get(a.getSex()).length);
      Integer c = (int)randC;
      agentC.put(a, c);
      float randO = random(0, climactericOnset.get(a.getSex()).length);
      Integer o = (int)randO;
      agentO.put(a, o);
      initalSugar.put(a, a.getSugarLevel());
    }
    if(agentC.get(a) <= a.getAge() && a.getAge() < agentO.get(a) && a.getSugarLevel() > initalSugar.get(a)){
      return true;
    }
    return false;
  }
  
  public boolean canBreed(Agent a, Agent b, LinkedList<Square> local){
    boolean hasEmptySquare = false;
    if(isFertile(a) && isFertile(b) && a.getSex() != b.getSex() && local.contains(b)){
      for(Square s : local){
        if(s.getAgent() == null){
          hasEmptySquare = true;
        }
      }
      if(hasEmptySquare){
        return true;
      }
    }
    return false;
  }
  
  public Agent breed(Agent a, Agent b, LinkedList<Square> aLocal, LinkedList<Square> bLocal){
    int metabolism;
    int vision;
    MovementRule m;
    ArrayList<Square> emptySquares = new ArrayList<Square>();
    
    if(canBreed(a, b, aLocal) && canBreed(a, b, bLocal)){
      return null;
    }
    else{
      if(random(0,2) == 0){
        metabolism = a.getMetabolism();
      }
      else{
        metabolism = b.getMetabolism();
      }
      if(random(0,2) == 0){
        vision = a.getVision();
      }
      else{
        vision = b.getVision();
      }
      m = a.getMovementRule();
      Agent kid = new Agent(metabolism, vision, 0, m);
      
      kid.nurture(a,b);
      a.gift(kid, initalSugar.get(a)/2);
      b.gift(kid, initalSugar.get(b)/2);
      
      for(Square sq : aLocal){
        if(sq.getAgent() == null){
          emptySquares.add(sq);
        }
      }
      for(Square s : bLocal){
        if(s.getAgent() == null){
          emptySquares.add(s);
        }
      }
      emptySquares.get((int)random(0, emptySquares.size())).setAgent(kid);
      return kid;
    }
  } 
}