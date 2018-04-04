class SocialNetwork{
  //using an adjacency list representation
  private LinkedList<SocialNetworkNode>[] adj;
  
  public SocialNetwork(SugarGrid g){
    //Initializes a new social network such that for every pair of Agents (x,y) on grid g, if x can see y (i.e. y is on a square that is in the vision of x), 
    //then the SocialNetworkNode for x is connected to the SocialNetworkNode for y in this new social network. Note that x might be able to see y even if y cannot see x.
    adj = new LinkedList[g.getWidth() * g.getHeight()];
    for(int x = 0; x < g.getWidth(); x++){
      for(int y = 0; y < g.getHeight(); y++){
        Agent currentAgent = g.getAgentAt(x, y);
        int index = x + ( y * 10 );
        if(currentAgent != null){
          LinkedList<Square> vision = g.generateVision(x, y, currentAgent.getVision());
          for(Square s : vision){
            Agent agentInVision = s.getAgent();
            if(agentInVision != null){
              SocialNetworkNode currentSNN = new SocialNetworkNode(agentInVision);
              adj[index].add(currentSNN);
            }
          }
        }
      }
    }
  }
  
  public boolean adjacent(SocialNetworkNode x, SocialNetworkNode y){
    //Returns true if agent x is adjacent to agent y in this SocialNetwork. If either x or y is not present in the social network, should return null.
    
  }
  
  public List<SocialNetworkNode> seenBy(SocialNetworkNode x){
    //Returns a list (either ArrayList or LinkedList) containing all the nodes that x is adjacent to. Returns null if x is not in the social network.
    
  }
  
  public List<SocialNetworkNode> sees(SocialNetworkNode y){
    //Returns a list (either ArrayList or LinkedList) containing all the nodes that are adjacent to y. Returns null if y is not in the social network.
    
  }
  
  public void resetPaint(){
    //Sets every node in the network to unpainted.
  }
  
  public SocialNetworkNode getNode(Agent a){
    // Returns the node containing the passed agent. Returns null if that agent is not represented in this graph.
    
  }
  //END OF QUESTION 2
  
  //START OF QUESTION 3
  
  public boolean pathExists(Agent x, Agent y){
    //Returns true if there exists any path through the social network that connects x to y. A path should start with node x,
    //proceed through any node x can see, and then any node that agent can see, and so on, until it reaches node y.
    
  }
  
  public List<Agent> bacon(Agent x, Agent y){
    //Returns the shortest path through the social network from node x to node y. If more than one path is the shortest, 
    //returns any of the shortest ones. If there is no path from x to y, returns null. 
    //You may find it useful to add some additional information to the SocialNetworkNode class, like a reference to the first node that added it to the search.
    
  }
  
  // Question 5
  // Modify your search code from Q3 so that it returns the shortest path between x and y based on the total distance travelled, not the total number of nodes moved through. 
  
}