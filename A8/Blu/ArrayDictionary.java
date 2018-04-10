import java.util.ArrayList;

public class ArrayDictionary<K extends Comparable<K>, V> implements Dictionary<K,V>{
    
    ArrayList<Pair> dict;
    
    // Must run at constant time (O(1) operations)
    public ArrayDictionary(){
        dict = new ArrayList<Pair>();
    }
    
    public void clear(){
        
    }
    
    public int size(){
        return dict.size();
    }
    
    // must run in O(size()) time (i.e. a number of operations 
    public V remove(K key){
        return null;
    }
    
    public V get(K key){
        return null;
    }
    
    // methods must run in O(log2(size())) time.
    public boolean contains(K key){
        for(int i = 0; i < dict.size(); i++){
            if(dict.get(i) == key){
                return true;
            }
        }
        return false;
    }
    
    public void put(K key, V value){
        
    }
    
    //Also, include the following method:
    public void bulkAdd(ArrayList<Pair<String,Integer>> data){
        //Adds all Pairs in Data to the ArrayDictionary at once. 
        //You may assume that data contains no duplicate keys, 
        //and no keys that are already found in the dictionary. 
        //The total time must not exceed O(n*log n), 
        //where n is the number of keys in the dictionary after data is added.
        //You may use Collections.sort() if necessary.  
    }
}
