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
        if(maxNode == null || myNode == null){
          println("Oh no!");
        }
        if(g.euclidianDistance(middle, maxNode) > g.euclidianDistance(middle, myNode)){
          maxNode = myNode;
        }
      }
    }
    return maxNode;
  }
}