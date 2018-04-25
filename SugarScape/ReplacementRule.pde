
import java.util.List;

class ReplacementRule{
  int minAge;
  int maxAge;
  AgentFactory fac;
  HashMap<Agent, Integer> listOfAgentAge;
  
  public ReplacementRule(int minAge, int maxAge, AgentFactory fac){
    this.minAge = minAge;
    this.maxAge = maxAge;
    this.fac = fac;
    this.listOfAgentAge = new HashMap<Agent, Integer>();
  }
  
  public boolean replaceThisOne(Agent a){
    if(a.isAlive() == false){
      a.setAge(maxAge + 1);
      return true;
    }
    if(listOfAgentAge.containsKey(a) == false){
      int randAge = (int)random(minAge, maxAge);
      listOfAgentAge.put(a, randAge);
    }
    else{
      if(listOfAgentAge.get(a) < a.getAge()){
        a.setAge(maxAge + 1);
        return true;
      }
    }
    return false;
  }
  
  public Agent replace(Agent a, List<Agent> others){
    return fac.makeAgent();
  }
}