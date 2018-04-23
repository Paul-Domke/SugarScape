class Agent{
  private int metabolism;
  private int vision;
  private int initialSugar;
  private MovementRule m;
  private int age;
  private int sugarLevel;
  private char sex;
  private boolean[] culture;
  
  public Agent(int metabolism, int vision, int initialSugar, MovementRule m){
    this.metabolism = metabolism;
    this.vision = vision;
    this.initialSugar = initialSugar;
    this.m = m;
    this.sugarLevel += this.initialSugar;
    this.age = 0;
    if(sex != 'X' || sex != 'Y'){
      assert(false);
    }
    float randNum = random(0, 2);
    if(randNum == 0){
      this.sex = 'X';
    }
    if(randNum == 1){
      this.sex = 'Y';
    }
    culture = new boolean[11];
  }
  
  public Agent(int metabolism, int vision, int initialSugar, MovementRule m, char sex){
    this.metabolism = metabolism;
    this.vision = vision;
    this.initialSugar = initialSugar;
    this.m = m;
    this.sugarLevel += this.initialSugar;
    this.age = 0;
    if(sex != 'X' || sex != 'Y'){
      assert(false);
    }
    this.sex = sex;
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
  
  public char getSex(){
    return sex;
  }
  
  public void influence(Agent other){
    int rand = (int)random(0, 11);
    if(culture[rand] != other.culture[rand]){
      other.culture[rand] = culture[rand];
      //"One of us, one of us. Gooba-gobble, gooba-gobble"
    }
  }
  
  public void nurture(Agent parent1, Agent parent2){
    for(int i = 0; i < culture.length; i++){
      if(random(0,2) == 0){
        culture[i] = parent1.culture[i];
      }
      else{
        culture[i] = parent2.culture[i];
      }
    }
  }
  
  public boolean getTribe(){
    int trueCount = 0;
    int falseCount = 0;
    for(boolean b : culture){
      if(b == false){
        falseCount++;
      }
      if(b == true){
        trueCount++;
      }
      if(trueCount < falseCount){
        return false;
      }
      if(trueCount > falseCount){
        return true;
      }
    }
    return false;
  }
  
  public void gift(Agent other, int amount){
    if(amount > sugarLevel){
      assert(false);
    }
    sugarLevel -= amount;
    other.sugarLevel += amount;
  }
  
  public void setAge(int howOld){
    assert(howOld >= 0);
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
  
  public boolean equals(Agent other) {
    return this == other;
  }
  
  public void display(int x, int y, int scale){
    fill(0);
    ellipse(x,y,3*scale/4,3*scale/4);
  }
}