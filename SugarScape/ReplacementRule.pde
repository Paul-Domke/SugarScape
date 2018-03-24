class ReplacementRule{
  int minAge;
  int maxAge;
  AgentFactory fac;
  ArrayList<Agent> listOfAgents;
  ArrayList<Integer> agentsAge;
  
  public ReplacementRule(int minAge, int maxAge, AgentFactory fac){
    this.minAge = minAge;
    this.maxAge = maxAge;
    this.fac = fac;
  }
  
  public boolean replaceThisOne(Agent a){
    if(a.isAlive() == false){
      a.setAge(maxAge + 1);
      return true;
    }
    if(listOfAgents.contains(a) == false){
      int randAge = (int)random(minAge, maxAge);
      listOfAgents.add(a);
      agentsAge.add(randAge);
    }
    else{
      int index = listOfAgents.indexOf(a);
      if(agentsAge.get(index) < a.getAge()){
        a.setAge(maxAge + 1);
        return true;
      }
    }
    return false;
  }
  
  //public Agent replace(Agent a, List<Agent> others){
    
  //}
}