class Graph{
  protected int x;
  protected int y;
  protected int howWide;
  protected int howTall;
  private String xlab;
  private String ylab;
  
  public Graph(int x, int y, int howWide, int howTall, String xlab, String ylab){
    this.x = x;
    this.y = y;
    this.howWide = howWide;
    this.howTall = howTall;
    this.xlab = xlab;
    this.ylab = ylab;
  }
  
  public void update(SugarGrid g){
    noStroke();
    fill(255);
    rect(x, y, howWide, howTall);
    stroke(0);
    strokeWeight(1);
    line(x, y+howTall, x+howWide, y+howTall);
    line(x, y, x, y+howTall);
    writeRotatedText(xlab, x+howWide, y+howTall+15, 0);
    writeRotatedText(ylab, x-5, y, -PI/2.0);
  }
  
  private void writeRotatedText(String s, int i, int j, float angle){
    pushMatrix();
    translate(i, j);
    rotate(angle);
    text(s, -s.length()*8, 0 );
    popMatrix();
  }
}

abstract class LineGraph extends Graph{
  int numberOfUpdates;
  
  public LineGraph(int x, int y, int howWide, int howTall, String xlab, String ylab){
    super(x, y, howWide, howTall, xlab, ylab);
    numberOfUpdates = 0;
  }
  
  public abstract int nextPoint(SugarGrid g);
  
  public void update(SugarGrid g){
    if(numberOfUpdates == 0){
      super.update(g);
      numberOfUpdates++;
    }
    else{
      fill(0);
      stroke(0);
      rect(numberOfUpdates + x, nextPoint(g) + y + howTall - 2, 1, 1);
      numberOfUpdates++;
      if(numberOfUpdates >= howWide){
        numberOfUpdates = 0;
      }
    }
  }
}

class NumberOfAgentsGraph extends LineGraph{
  
  public NumberOfAgentsGraph(int x, int y, int howWide, int howTall, String xlab, String ylab){
    super(x, y, howWide, howTall, xlab, ylab);
  }
  
  public int nextPoint(SugarGrid g){
    return -g.getAgents().size()/10;
  }
}

class VisionGraph extends LineGraph{
  
  public VisionGraph(int x, int y, int howWide, int howTall, String xlab, String ylab){
    super(x, y, howWide, howTall, xlab, ylab);
  }
  
  public int nextPoint(SugarGrid g){
  
    ArrayList<Agent> Agents = g.getAgents();
    int numberOfAgents = Agents.size();
    int totalVision = 0;
    
    for(int i = 0; i < numberOfAgents; i++){
      Agent current = Agents.get(i);
      totalVision += current.getVision();
    }
    return 10*(-totalVision/numberOfAgents);
  }
}


abstract class CDFGraph extends Graph{
  int callsPerValue;
  int numOfUpdates;
  
  public CDFGraph(int x, int y, int howWide, int howTall, String xlab, String ylab, int callsPerValue){
    super(x, y, howWide, howTall, xlab, ylab);
    this.callsPerValue = callsPerValue;
    this.numOfUpdates = 0;
  }
  
  public abstract void reset(SugarGrid g);
  
  public abstract int nextPoint(SugarGrid g);
  
  public abstract int getTotalCalls(SugarGrid g);
  
  public void update(SugarGrid g){
    // Sets a field numUpdates to 0.
    numOfUpdates = 0;
    //Call the update method of the superclass
    super.update(g);
    //Call the reset method of the subclass, which resets any internal state
    reset(g);
    //Compute the number of objects to average for each cell in the graph. numPerCell should be equal 
    //to the with of the graph divided by whatever is returned by getTotalCalls() in the subclass
    int numPerCell = howWide/getTotalCalls(g);
    //While numUpdates is less than getTotalCalls() in the subclass,
    while(numOfUpdates < getTotalCalls(g)){
      //Draw a rectangle numPerCell wide, 1 pixel tall, starting at (numUpdates, nextPoint())
      rect(numOfUpdates, nextPoint(g), numPerCell, 1);
      //Increase numUpdates by 1
      numOfUpdates++;
    }
  }
}

public class WealthCDF extends CDFGraph{
  
  int sugarSoFar;
  ArrayList<Agent> agentList;
  
  public WealthCDF(int x, int y, int howWide, int howTall, String xlab, String ylab, int callsPerValue){
    super(x, y, howWide, howTall, xlab, ylab, callsPerValue);
  }
  
  public void reset(SugarGrid g){
    // Stores in a field of this class an ArrayList<Agent> sorted by sugar levels.
    Sorter s = new QuickSorter();
    agentList = g.getAgents();
    s.sort(agentList);
    //Stores in another field of this class the total sugar owned by all agents.
    
    //Also sets a counter sugarSoFar to 0.
     
  }
  
  public int nextPoint(SugarGrid g){
    return 0;
  }
  
  public int getTotalCalls(SugarGrid g){
    return 0;
  }
}