
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
    int randMetabolism = (int)random(minMetabolism, maxMetabolism + 1);
    int randVision = (int)random(minVision, maxVision + 1);
    int randInitalSugar = (int)random(minInitialSugar, maxInitialSugar + 1);
    return new Agent(randMetabolism, randVision, randInitalSugar, m);
  }
}