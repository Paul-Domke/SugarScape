abstract class Sorter{
  
  public abstract void sort(ArrayList<Agent> al);
  
  public boolean lessThan(Agent a, Agent b){
    if(a.getSugarLevel() < b.getSugarLevel()){
      return true;
    }
    return false;
  }
}

class BubbleSorter extends Sorter{
  public void sort(ArrayList<Agent> al){
    for(int i = 0; i < al.size() - 1; i++){
      for(int j = 0; j < al.size() - ( i + 1 ); j++){
        Agent a = al.get(j + 1);
        Agent b = al.get(j);
        if(lessThan(a,b)){
          al.set(j, a);
          al.set(j + 1, b);
          println();
        }
      }
    }
  }
}

class InsertionSorter extends Sorter{
  public void sort(ArrayList<Agent> al){
    for(int i = 1; i < al.size(); i++){
      int j = i - 1;
      Agent current = al.get(i);
      while(j >= 0 && lessThan(current,al.get(j))){
        al.set(j+1, al.get(j));
        j = j -1;
      }
      al.set(j+1, current);
    }
  }
}

class MergeSorter extends Sorter{
  public void sort(ArrayList<Agent> al){
    
  }
}

class QuickSorter extends Sorter{
  public void sort(ArrayList<Agent> al){
    
  }
}