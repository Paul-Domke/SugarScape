import java.util.LinkedList;
import java.util.Collections;

interface MovementRule{
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle);
}

class SugarSeekingMovementRule implements MovementRule{
  
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle){
    Square max = neighbourhood.peek();
    Collections.shuffle(neighbourhood);
    for (Square s : neighbourhood) {
      if (s.getSugar() > max.getSugar() ||
          (s.getSugar() == max.getSugar() && 
           g.euclidianDistance(s, middle) < g.euclidianDistance(max, middle)
          )
         ) {
        max = s;
      } 
    }
    return max;
  }
}

class PollutionMovementRule implements MovementRule{
    
    public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle){
    Square maxNode = neighbourhood.peek();
    Collections.shuffle(neighbourhood);
    boolean bestSquareHasNoPollution = (maxNode.getPollution() == 0);
    for (Square s : neighbourhood) {
      boolean newSquareCloser = (g.euclidianDistance(s, middle) < g.euclidianDistance(maxNode, middle));
      if (s.getPollution() == 0) {
        if (!bestSquareHasNoPollution || s.getSugar() > maxNode.getSugar() ||
            (s.getSugar() == maxNode.getSugar() && newSquareCloser)
           ) {
          maxNode = s;
        }
      }
      else if (!bestSquareHasNoPollution) { 
        float newRatio = s.getSugar()*1.0/s.getPollution();
        float curRatio = maxNode.getSugar()*1.0/maxNode.getPollution();
        if (newRatio > curRatio || (newRatio == curRatio && newSquareCloser)) {
          maxNode = s;
        }
      }
    }
    return maxNode;
  }
}

class CombatMovementRule extends SugarSeekingMovementRule{
  int alpha;
  
  public CombatMovementRule(int alpha){
    this.alpha = alpha;
  }

  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle){
    Agent middleAgent = middle.getAgent();
    boolean tribe = middleAgent.getTribe();
    for(Square s : neighbourhood){
      if(s.getAgent() != null){
        if(s.getAgent().getTribe() == tribe || s.getAgent().getSugarLevel() > middleAgent.getSugarLevel()){
          neighbourhood.remove(s);
        }
      }
    }
    for(Square s : neighbourhood){
      LinkedList<Square> newVision = g.generateVision(s.getX(), s.getY(), middleAgent.getVision());
      for(Square sq : newVision){
        if(sq.getAgent().getSugarLevel() > middleAgent.getSugarLevel() && sq.getAgent().getTribe() != tribe){
          neighbourhood.remove(sq);
        }
      }
    }
    LinkedList<Square> temp = neighbourhood;
    for(Square s : neighbourhood){
      if(s.getAgent() != null){
        int newSugarLevel = s.getAgent().getSugarLevel() + s.getSugar() + alpha;
        int newMaxSugarLevel = s.getAgent().getSugarLevel() + s.getMaxSugar() + alpha;
        Square newSquare = new Square(newSugarLevel, newMaxSugarLevel, s.getX(), s.getY());
        neighbourhood.remove(s);
        neighbourhood.add(newSquare);
      }
    }
    Square target = super.move(neighbourhood, g, middle);
    if(target == null){
      return target;
    }
    else{
      Agent casualty = target.getAgent();
      target.setAgent(null);
      middleAgent.addSugar(casualty.getSugarLevel() + alpha)
      g.killAgent(casualty);
      return target;
    }
  }
}