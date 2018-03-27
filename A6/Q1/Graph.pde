class Graph{
  int x;
  int y;
  int howWide;
  int howTall;
  String xlab;
  String ylab;
  
  public Graph(int x, int y, int howWide, int howTall, String xlab, String ylab){
    this.x = x;
    this.y = y;
    this.howWide = howWide;
    this.howTall = howTall;
    this.xlab = xlab;
    this.ylab = ylab;
  }
  
  public void update(SugarGrid g){
    fill(255);
    stroke(255);
    rect(x,y,howWide,howTall);
    fill(0);
    stroke(0);
    line(x, y + howTall, x + howWide, y + howTall);
    line(x, y, x, y + howTall);
    text(xlab, x + (howWide/2), y + (howTall + 20));
    pushMatrix();
    translate(x, y);
    rotate(-PI/2.0);
    text(ylab, -howTall/2, -20 );
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
    return -g.getAgents().size();
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
  
  public CDFGraph(int x, int y, int howWide, int howTall, String xlab, String ylab, int callsPerValue){
    super(x, y, howWide, howTall, xlab, ylab);
    this.callsPerValue = callsPerValue;
  }
  
  public abstract void reset(SugarGrid g);
  
  public abstract int nextPoint(SugarGrid g);
  
  public abstract int getTotalCalls(SugarGrid g);
  
  public void update(SugarGrid g){
    
  }
}

public class WealthCDF extends CDFGraph{
  
  public WealthCDF(int x, int y, int howWide, int howTall, String xlab, String ylab, int callsPerValue){
    super(x, y, howWide, howTall, xlab, ylab, callsPerValue);
  }
  
  public void reset(SugarGrid g){
    
  }
  
  public int nextPoint(SugarGrid g){
    return 0;
  }
  
  public int getTotalCalls(SugarGrid g){
    return 0;
  }
}