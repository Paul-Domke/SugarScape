import java.util.Iterator;

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
        int index = x + ( y * g.getWidth());
        adj[index] = new LinkedList<SocialNetworkNode>();
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
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
<<<<<<< HEAD
      if(socialNetwork.peek().getAgent() == x.getAgent()){
        for(int j = 0; j < socialNetwork.size(); j++){
          SocialNetworkNode currentNode = socialNetwork.get(j);
          if(y == currentNode){
=======
      if(socialNetwork.peek() == x){
        for(int j = 0; j < socialNetwork.size(); j++){
          SocialNetworkNode currentNode = socialNetwork.get(j);
          if(currentNode == y){
>>>>>>> 4fa460f94b2c9a8ac61af5fbf1a2ec69c195eeaa
            return true;
          }
        }
      }
    }
    return false;
  }
  
  public LinkedList<SocialNetworkNode> seenBy(SocialNetworkNode x){
    //Returns a list (either ArrayList or LinkedList) containing all the nodes that x is adjacent to. Returns null if x is not in the social network.
    LinkedList<SocialNetworkNode> seenBy = new LinkedList<SocialNetworkNode>();
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
      for(int j = 0; j < socialNetwork.size(); j++){
        SocialNetworkNode currentNode = socialNetwork.get(j);
        if(currentNode == x){
          seenBy.add(socialNetwork.peek());
        }
      }
    }
    if(seenBy.size() == 0){
      return null;
    }
    return seenBy;
  }
  
  public LinkedList<SocialNetworkNode> sees(SocialNetworkNode y){
    //Returns a list (either ArrayList or LinkedList) containing all the nodes that are adjacent to y. Returns null if y is not in the social network.
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
      if(socialNetwork.peek() == y){
        return socialNetwork;
      }
    }
    return null;
  }
  
  public void resetPaint(){
    //Sets every node in the network to unpainted.
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
      for(int j = 0; j < socialNetwork.size(); j++){
        SocialNetworkNode currentNode = socialNetwork.get(j);
        currentNode.unpaint();
      }
    }
  }
  
  public SocialNetworkNode getNode(Agent a){
    // Returns the node containing the passed agent. Returns null if that agent is not represented in this graph.
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
      for(int j = 0; j < socialNetwork.size(); j++){
        SocialNetworkNode currentNode = socialNetwork.get(j);
        if(currentNode.getAgent() == a){
          return currentNode;
        }
      }
    }
    return null;
  }
  //END OF QUESTION 2
  
  //START OF QUESTION 3
  
  public boolean pathExists(Agent x, Agent y){
    //Returns true if there exists any path through the social network that connects x to y. A path should start with node x,
<<<<<<< HEAD
    //proceed through any node x can see, and then any node that agent can see, and so on, until it reaches node y. 
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> q = new LinkedList<SocialNetworkNode>();
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
      if(socialNetwork.peek() != null && socialNetwork.peek().getAgent() == x){
        SocialNetworkNode currentSNN = socialNetwork.peek();
        currentSNN.paint();
        q.add(currentSNN);
        
        Iterator<SocialNetworkNode> it;
        while(q.size() != 0){
          currentSNN = q.poll();
          
          SocialNetworkNode n;
          it = adj[i].listIterator();
          
          while(it.hasNext()){
            n = it.next();
            if(n.getAgent()==y){
              resetPaint();
              return true;
            }
            if(!n.painted()){
              n.paint();
              q.add(n);
            }
          }
        }
      }
=======
    //proceed through any node x can see, and then any node that agent can see, and so on, until it reaches node y.
    for(int i = 0; i < adj.length; i++){
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];
      
>>>>>>> 4fa460f94b2c9a8ac61af5fbf1a2ec69c195eeaa
    }
    return false;
  }
/*
    if(x == y){
      return true;
    }
    for(int i = 0; i < adj.length; i++){  //Goes through all Social Networks
      //println(i);
      LinkedList<SocialNetworkNode> socialNetwork = adj[i];  //Gets the social network to work with
      if(socialNetwork.peek() != null){
        SocialNetworkNode firstSNN = socialNetwork.peek();
        println(firstSNN.getAgent().getSugarLevel());
        println(x.getSugarLevel());
        firstSNN.paint();  //paints it visited
        Agent firstAgent = firstSNN.getAgent();  //firstSNN agent
        if(x == firstAgent){  //if this is the one we are looking for
          println("Here");
          for(int j = 1; j < socialNetwork.size(); j++){
            println(j);
            SocialNetworkNode nextSNN = socialNetwork.get(j);
            if(nextSNN.painted()){
              return false;
            }
            pathExists(nextSNN.getAgent(), y);
          }
        }
      }
    }
    return false;
  } */
  
  public LinkedList<Agent> bacon(Agent x, Agent y){
    //Returns the shortest path through the social network from node x to node y. If more than one path is the shortest, 
    //returns any of the shortest ones. If there is no path from x to y, returns null. 
    //You may find it useful to add some additional information to the SocialNetworkNode class, like a reference to the first node that added it to the search.
    return null;
  }
  
  // Question 5
  // Modify your search code from Q3 so that it returns the shortest path between x and y based on the total distance travelled, not the total number of nodes moved through. 
  
}