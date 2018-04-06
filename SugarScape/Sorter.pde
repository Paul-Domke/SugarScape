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
  
  ArrayList<Agent> aux;
  
  public void sort(ArrayList<Agent> al){
    aux = new ArrayList<Agent>(al);
    sort(al, 0, al.size());
  }
  
  private void sort(ArrayList<Agent> al, int start, int end){
    if(end - start == 1) return;
    
    int middle = (end + start) /2;
    sort(al, start, middle);
    sort(al, middle, end);
    merge(al, start, end);
  }
  
  private void merge(ArrayList<Agent> al, int start, int end){
    
    for(int i = start; i < end; i++){
      aux.set(i, al.get(i));
    }
    
    int middle = (end + start)/2;
    int current = start;
    int i = start;
    int j = middle;
    
    while(i < middle && j < end){
      if(lessThan(aux.get(j),aux.get(i))){
        al.set(current++, aux.get(j++));
      }
      else{
        al.set(current++, aux.get(i++));
      }
    }
    
    if(i == middle){
      while(j < end){
        al.set(current++, aux.get(j++));
      }
    }
    if(j == end){
      while(i < middle){
        al.set(current++, aux.get(i++));
      }
    }
  }
}

class QuickSorter extends Sorter{
  public void sort(ArrayList<Agent> al){
    Collections.shuffle(al);
    sort(al, 0, al.size() - 1);
  }
  
  private void sort(ArrayList<Agent> al, int lo, int hi){
    if(hi <= lo) return;
    int j = partition(al, lo, hi);
    sort(al, lo, j-1);
    sort(al, j+1, hi);
  }
  
  private int partition(ArrayList<Agent> al, int lo, int hi){
    int i = lo;
    int j = hi + 1;
    
    while(true){
      while(lessThan(al.get(++i), al.get(lo))){
        if(i == hi) break;
      }
      while(lessThan(al.get(lo), al.get(--j))){
        if(j == lo) break;
      }
      if(i >= j) break;
      exchange(al, i, j);
    }
    exchange(al, lo, j);
    return j;
  }
  
  private void exchange(ArrayList<Agent> al, int i, int j){
    Agent temp = al.get(i);
    al.set(i, al.get(j));
    al.set(j, temp);
  }
}