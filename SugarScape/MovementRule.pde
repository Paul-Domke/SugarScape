import java.util.LinkedList;
import java.util.Collections;

class MovementRule{
  
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
    //println("square choosen to move to x, y, sugarlevel, maxsugar: ", maxNode.getX(), maxNode.getY(), maxNode.getSugar(), maxNode.getMaxSugar());
    return maxNode;
  }
}