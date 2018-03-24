interface GrowthRule{
  
  public void growBack(Square s);
  
}

class GrowBackRule implements GrowthRule{
  private int rate;
  
  public GrowBackRule(int rate){
    this.rate = rate;
  }
  
  public void growBack(Square s){
    int maxSugar = s.getMaxSugar();
    int currentSugar = s.getSugar();
    int newSugarLevel = currentSugar + rate;
    if(newSugarLevel > maxSugar){
      s.setSugar(maxSugar);
    }
    else{
      s.setSugar(newSugarLevel);
    }
  }
}

class SeasonalGrowbackRule implements GrowthRule{
  int alpha;
  int beta;
  int gamma;
  int equator;
  int numSquares;
  boolean northSummer;
  int dayCounter;
  
  public SeasonalGrowbackRule(int alpha, int beta, int gamma, int equator, int numSquares){
    this.alpha = alpha;
    this.beta = beta;
    this.gamma = gamma;
    this.equator = equator;
    this.numSquares = numSquares;
    northSummer = true;
    dayCounter = 0;
  }
  
  public void growBack(Square s){
    
    int sqY = s.getY();
    if(sqY >= equator && northSummer == false){
      //South during its summer
      int maxSugar = s.getMaxSugar();
      int currentSugar = s.getSugar();
      int alphaSug = currentSugar + alpha;
      if(alphaSug > maxSugar){
        s.setSugar(maxSugar);
      }
      else{
        s.setSugar(alphaSug);
      }
    }
    if(sqY <= equator && northSummer == true){
      //North during its summer
      int maxSugar = s.getMaxSugar();
      int currentSugar = s.getSugar();
      int alphaSug = currentSugar + alpha;
      if(alphaSug > maxSugar){
        s.setSugar(maxSugar);
      }
      else{
        s.setSugar(alphaSug);
      }
    }
    if(sqY >= equator && northSummer == true){
      //South not during summer
      int maxSugar = s.getMaxSugar();
      int currentSugar = s.getSugar();
      int betaSug = currentSugar + beta;
      if(betaSug > maxSugar){
        s.setSugar(maxSugar);
      }
      else{
        s.setSugar(betaSug);
      }
    }
    if(sqY <= equator && northSummer == false){
      //North not duting summer
      int maxSugar = s.getMaxSugar();
      int currentSugar = s.getSugar();
      int betaSug = currentSugar + beta;
      if(betaSug > maxSugar){
        s.setSugar(maxSugar);
      }
      else{
        s.setSugar(betaSug);
      }
    }
    int eq = gamma * numSquares;
    dayCounter++;
    if(eq == dayCounter){
      if(northSummer){
        northSummer = false;
      }
      else{
        northSummer = true;
      }
      dayCounter = 0;
    }
  }
  
  public boolean isNorthSummer(){
    return northSummer;
  }
}