import java.util.LinkedList;
import java.util.Collections;

interface MovementRule{
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle);
}

class SugarSeekingMovementRule implements MovementRule{
  
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle){
   
    Collections.shuffle(neighbourhood);
    int max = 0;
    Square maxNode = neighbourhood.get(0);
    
    for(int i = 0; i < neighbourhood.size(); i++){
      Square myNode = neighbourhood.get(i);
      if(myNode.getSugar() > max){
        max = myNode.getSugar();
        maxNode = myNode;        
      }
      if(myNode.getSugar() == max){
        if(g.euclidianDistance(middle, maxNode) > g.euclidianDistance(middle, myNode)){
          maxNode = myNode;
        }
      }
    }
    return maxNode;
  }
}

class PollutionMovementRule implements MovementRule{
    
    public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle){
    
    Collections.shuffle(neighbourhood);
    Square maxNode = neighbourhood.get(0);
    double maxRatio = 0;
    double ratio = 0;
    for(int i = 0; i < neighbourhood.size(); i++){
      Square myNode = neighbourhood.get(i);
      if(myNode.getPollution() == 0){
        ratio = 0;
      }
      else{
        ratio = myNode.getSugar()/myNode.getPollution();
      }
      if(ratio > maxRatio){
        maxRatio = myNode.getSugar();
        maxNode = myNode;        
      }
      if(ratio == maxRatio){
        if(g.euclidianDistance(middle, maxNode) > g.euclidianDistance(middle, myNode)){
          maxNode = myNode;
        }
      }
      if(myNode.getPollution() == 0 && maxNode.getPollution() >= 0){
        if(myNode.getPollution() == 0 && maxNode.getPollution() == 0){
          if(g.euclidianDistance(middle, maxNode) > g.euclidianDistance(middle, myNode)){
            maxNode = myNode;
          }
        }
        maxNode = myNode;
      }
    }
   return maxNode;
  }
}