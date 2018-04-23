interface GrowthRule{
  public void growBack(Square s);
}

class GrowBackRule implements GrowthRule{
  private int rate;
  
  public GrowBackRule(int rate){
    this.rate = rate;
  }
  
  public void growBack(Square s){
    s.setSugar(s.getSugar() + rate);
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
  
  public void growBack(Square s) {
    if ( (s.getY() <= equator && northSummer) || (s.getY() > equator && !northSummer)) {
      s.setSugar(s.getSugar() + alpha);
    }
    else {
      s.setSugar(s.getSugar() + beta);      
    }
    
    dayCounter += 1;
    if (dayCounter >= gamma*numSquares) {
      northSummer = !northSummer;
      dayCounter = 0;
    }
  }
  
  public boolean isNorthSummer(){
    return northSummer;
  }
}