class Square{
  private int sugarLevel;
  private int maxSugarLevel;
  private int x;
  private int y;
  private Agent a;
  private int pollution;

  public Square(int sugarLevel, int maxSugarLevel, int x, int y){
    this.sugarLevel = sugarLevel;
    this.maxSugarLevel = maxSugarLevel;
    this.x = x;
    this.y = y;
    this.pollution = 0;
  }
  
  public int getPollution(){
    return pollution;
  }
  
  public void setPollution(int level){
    pollution = level;
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  public int getSugar(){
    return sugarLevel;
  }
  
  public int getMaxSugar(){
    return maxSugarLevel;
  }
  
  public void setSugar(int howMuch){
    sugarLevel = howMuch;
    if(howMuch < 0){
      sugarLevel = 0;
    }
    if(howMuch > maxSugarLevel){
      sugarLevel = maxSugarLevel;
    }
  }
  
  public void setMaxSugar(int howMuch){
    maxSugarLevel = howMuch;
    if(howMuch < 0){
      maxSugarLevel = 0;
    }
    if(sugarLevel > maxSugarLevel){
      sugarLevel = maxSugarLevel;
    }
  }
  
  public Agent getAgent(){
    return a;
  }
  
  public void setAgent(Agent a){
    if(this.a == null || this.a == a || a == null){
      this.a = a;
    }
    else{
      assert(false);
    }
  }
  
  public boolean equals(Square other) {
    if (this.x == other.getX()
        && this.y == other.getY()
        && this.sugarLevel == other.getSugar()
        && this.maxSugarLevel == other.getMaxSugar()
        && this.a.equals(other.getAgent())
       ) {
      return true;
    }
    else {
      return false;
    }
  }
  
  public void display(int size){
    strokeWeight(4);
    stroke(255);
    fill(255, 255, 255 - sugarLevel/6.0*255);
    rect(size * x, size * y, size, size);
    if(getAgent() != null){
      a.display(size*x+size/2, size*y + size/2, size);
    }
  }
}