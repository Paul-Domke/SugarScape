

class Agent{
  private int metabolism;
  private int vision;
  private int initialSugar;
  private MovementRule m;
  private int age;
  private int sugarLevel;
  
  public Agent(int metabolism, int vision, int initialSugar, MovementRule m){
    this.metabolism = metabolism;
    this.vision = vision;
    this.initialSugar = initialSugar;
    this.m = m;
    this.sugarLevel += this.initialSugar;
    this.age = 0;
  }
  
  public int getAge(){
    return age;
  }
  
  public int getMetabolism(){
    return metabolism;
  }
  
  public int getVision(){
    return vision;
  }
  
  public int getSugarLevel(){
    return sugarLevel;
  }
  
  public MovementRule getMovementRule(){
    return m;
  }
  
  public void setAge(int howOld){
    if(howOld < 0){
      assert(false);
    }
    age = howOld;
  }
  
  public void move(Square source, Square destination){
    if(source == destination || destination.getAgent() == null){
      source.setAgent(null);
      destination.setAgent(this);
    }
    else{
      assert(false);
    }
  }
  public void step(){
    age++;
    sugarLevel -= metabolism;
    if(sugarLevel < 0){
      sugarLevel = 0;
    }
  }
  public boolean isAlive(){
    if(sugarLevel > 0){
      return true;
    }
    return false;
  }
  public void eat(Square s){
    sugarLevel += s.getSugar();
    s.setSugar(0);
  }
  public void display(int x, int y, int scale){
    fill(0);
    ellipse(x,y,3*scale/4,3*scale/4);
  }
}