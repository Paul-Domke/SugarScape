class PollutionRule{
  int gatheringPollution;
  int eatingPollution;
  
  public PollutionRule(int gatheringPollution, int eatingPollution){
    this.gatheringPollution = gatheringPollution;
    this.eatingPollution = eatingPollution;
  }
  
  public void pollute(Square s){
    if(s.getAgent() != null){
      Agent a = s.getAgent();
      int agentPoll = a.getMetabolism();
      int sugarLevel = s.getSugar();
      eatingPollution  += agentPoll;
      gatheringPollution += sugarLevel;
    }
  }
}