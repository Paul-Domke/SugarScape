import java.util.LinkedList;
import java.util.Map;

class SugarGrid{
  private int w;
  private int h;
  private int sideLength;
  private GrowthRule g;
  private Square[][] grid;
  private ArrayList<Agent> listOfAgents;
  
  Integer xEarlyChildbearingStartAge = 12;
  Integer xLateChildbearingAge = 15;
  
  Integer xEarlyClimactericStartAge = 50;
  Integer xLateClimactericStartAge = 60;
  
  Integer yEarlyChildbearingStartAge = 12;
  Integer yLateChildbearingAge = 15;
  
  Integer yEarlyClimactericStartAge = 40;
  Integer yLateClimactericStartAge = 50;
  
  int numOfAgents = 400;
  int minMetabolism = 1;
  int maxMetabolism = 4;
  int minVision = 1;
  int maxVision = 6;
  int minInitialSugar = 50;
  int maxInitialSugar = 100;
  
  private FertilityRule fr;
  private ReplacementRule rr;
  
  AgentFactory af;

  public SugarGrid(int w, int h, int sideLength, GrowthRule g){
    this.w = w;
    this.h = h;
    this.sideLength = sideLength;
    this.g = g;
    this.listOfAgents = new ArrayList<Agent>();
    grid = new Square[w][h];
    for (int wid = 0; wid < w; wid++) {
      for (int hei = 0; hei < h; hei++) {
        grid[wid][hei] = new Square(0, 0, wid, hei);
      }
    }
    Map<Character, Integer[]> childbearingOnset = new HashMap<Character, Integer[]>();
    childbearingOnset.put('X', new Integer[]{xEarlyChildbearingStartAge, xLateChildbearingAge});
    childbearingOnset.put('Y', new Integer[]{yEarlyChildbearingStartAge, yLateChildbearingAge});
    Map<Character,Integer[]> climactericOnset = new HashMap<Character, Integer[]>();
    climactericOnset.put('X', new Integer[]{xEarlyClimactericStartAge, xLateClimactericStartAge});
    climactericOnset.put('Y', new Integer[]{yEarlyClimactericStartAge, yLateClimactericStartAge});
    fr = new FertilityRule(childbearingOnset, climactericOnset);
    af = new AgentFactory(minMetabolism, maxMetabolism, minVision, maxVision, minInitialSugar, maxInitialSugar, new SugarSeekingMovementRule());
    rr = new ReplacementRule(0, 100, af);
  }
  
  public void killAgent(Agent a){
    
  }
  
  public int getWidth(){
    return w;
  }
  
  public int getHeight(){
    return h;
  }
  
  public int getSquareSize(){
    return sideLength;
  }
  
  public int getSugarAt(int i, int j){
    return grid[i][j].getSugar();
  }
  
  public int getMaxSugarAt(int i, int j){
    return grid[i][j].getMaxSugar();
  }
  
  public Agent getAgentAt(int i, int j){
    
    //Just to make sure it returns null when no agent
    if(grid[i][j].getAgent() == null){
      return null;
    }
    
    return grid[i][j].getAgent();
  }
  
  public void placeAgent(Agent a, int x, int y){
    //Square has to be empty no matter what
    if(grid[x][y].getAgent() == null){
      grid[x][y].setAgent(a);
      listOfAgents.add(a);
    }
    else{
      assert(false);
    }
  }
  
  public double euclidianDistance(Square s1, Square s2){

    int s1X = s1.getX();
    int s1Y = s1.getY();
    int s2X = s2.getX();
    int s2Y = s2.getY();
    
    int xIn = abs(s1X - s2X);
    int xOut = min(abs(s1X - 0), abs(w - s1X)) + min(abs(s2X - 0), abs(w - s2X));
    int yIn = abs(s1Y - s2Y);
    int yOut = min(abs(s1Y - 0), abs(h - s1Y)) + min(abs(s2Y - 0), abs(h - s2Y));
    
    int xMin = min(xIn, xOut);
    int yMin = min(yIn, yOut);
    
    double finalProduct = Math.sqrt((xMin * xMin) + (yMin * yMin));
    
    return finalProduct;
  }
  
  
  public void addSugarBlob(int x, int y, int radius, int max){
    Square sugarBlobCenter = grid[x][y];
    if(sugarBlobCenter.getMaxSugar() <= max){
      sugarBlobCenter.setMaxSugar(max);
      sugarBlobCenter.setSugar(max);
    }
    else{
      sugarBlobCenter.setSugar(sugarBlobCenter.getMaxSugar());
    }
    for(int count = 1; count <= max(w,h); count++){
      for(int xAs = 0; xAs < w; xAs++){
        for(int yAx = 0; yAx < h; yAx++){
          Square current = grid[xAs][yAx];
          if(euclidianDistance(current, sugarBlobCenter) < radius * (count)){
            if(max - count > current.getMaxSugar()){
              current.setMaxSugar(max - count);
              current.setSugar(max - count);
            }
            else{
              current.setSugar(current.getMaxSugar());
            }
          }
        }
      }
    }
  }
  
  public LinkedList<Square> generateVision(int x, int y, int radius){
    LinkedList<Square> finalList = new LinkedList<Square>();
    for(int xVision = 0; xVision < w; xVision++){
      for(int yVision = 0; yVision < h; yVision++){
        Square current = grid[xVision][yVision];
        if(euclidianDistance(grid[x][y], current) <= radius){
          if(x == current.getX() || y == current.getY()){
            finalList.add(current);
          }
        }
      }
    }
    return finalList;
  }
  
  public void update(){
    ArrayList<Agent> lastAgent = new ArrayList<Agent>();
    for(int gridX = 0; gridX < w; gridX++){
      for(int gridY = 0; gridY < h; gridY++){
        Square current = grid[gridX][gridY];
        g.growBack(current);
        if(current.getAgent() != null && lastAgent.contains(current.getAgent()) == false){
          Agent currentAgent = current.getAgent();
          LinkedList<Square> sight = generateVision(current.getX(), current.getY(), currentAgent.getVision());
          Square dest = null;
          MovementRule move = currentAgent.getMovementRule();
          if(rr.replaceThisOne(currentAgent)){
            rr.replace(currentAgent, listOfAgents);
          }
          for(Square s : sight){
            if(s.getAgent() != null){
              if(fr.canBreed(currentAgent, s.getAgent(), sight) == true){
                fr.breed(currentAgent, s.getAgent(), sight, generateVision(s.getX(), s.getY(), s.getAgent().getVision()));
              }
            }
          }
          while(sight.size() != 0){
            dest = move.move(sight, this, grid[(w - 1)/2][(h - 1)/2]);
            if(dest.getAgent() == null){
              currentAgent.move(current, dest);
              break;
            }
            else{
              sight.remove(dest);
            }
            
          }
          currentAgent.step();
          if(currentAgent.isAlive()){
            currentAgent.eat(dest);
            lastAgent.add(currentAgent);
          }
          else{
            dest.setAgent(null);
            listOfAgents.remove(currentAgent);
          }
        }
      }
    }
  }
  
  public void display(){
    for(int xSquare = 0; xSquare < w; xSquare++){
      for(int ySquare = 0; ySquare < h; ySquare++){
        Square sq = grid[xSquare][ySquare];
        sq.display(sideLength);
      }
    }
  }
  
  public void addAgentAtRandom(Agent a){
    ArrayList<Square> nullSquares = new ArrayList<Square>();
    for(int gridX = 0; gridX < w; gridX++){
      for(int gridY = 0; gridY < h; gridY++){
        Square current = grid[gridX][gridY];
        if(current.getAgent() == null){
          nullSquares.add(current);
        }
      }
    }
    int rand = (int)random(nullSquares.size());
    Square randSquare = nullSquares.get(rand);
    placeAgent(a, randSquare.getX(), randSquare.getY());
  }
  
  public ArrayList<Agent> getAgents(){
    return listOfAgents;
  }
}