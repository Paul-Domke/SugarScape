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
    
  }
}