

class GrowBackRule{
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