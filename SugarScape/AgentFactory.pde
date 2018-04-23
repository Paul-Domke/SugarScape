import java.util.Random;

class AgentFactory{
  int minMetabolism;
  int maxMetabolism;
  int minVision;
  int maxVision;
  int minInitialSugar;
  int maxInitialSugar;
  MovementRule m;
  
  public AgentFactory(int minMetabolism, int maxMetabolism, int minVision, int maxVision, int minInitialSugar, int maxInitialSugar, MovementRule m){
    this.minMetabolism = minMetabolism;
    this.maxMetabolism = maxMetabolism;
    this.minVision = minVision;
    this.maxVision = maxVision;
    this.minInitialSugar = minInitialSugar;
    this.maxInitialSugar = maxInitialSugar;
    this.m = m;
    
  }
  
  public Agent makeAgent(){
    Random r = new Random();
    int randMetabolism = minMetabolism + r.nextInt(maxMetabolism + 1 - minMetabolism);
    int randVision = minVision + r.nextInt(maxVision + 1 - minVision);
    int randInitalSugar = minInitialSugar + r.nextInt(maxInitialSugar + 1 - minInitialSugar);
    return new Agent(randMetabolism, randVision, randInitalSugar, m);
  }
}