import java.util.ArrayList;

public class ArrayDictionary<K extends Comparable<K>, V> implements Dictionary<K,V>{
    ArrayList<Pair<K, V>> dict;
    
    // Must run at constant time (O(1) operations)
    public ArrayDictionary(){
        dict = new ArrayList<Pair<K, V>>();
    }
    
    public void clear(){
        dict = new ArrayList<Pair<K, V>>();
    }
    
    public int size(){
        return dict.size();
    }
    
    // must run in O(size()) time
    public V remove(K key){
        for(int i = 0; i < dict.size(); i++){
            K currentKey = dict.get(i).getKey();
            V currentValue = dict.get(i).getValue();
            if(currentKey.compareTo(key) == 0){
                dict.remove(i);
                return currentValue;
            }
        }
        assert(1 == 0);
        return null;
    }
    
    public V get(K key){
        for(int i = 0; i < dict.size(); i++){
            K currentKey = dict.get(i).getKey();
            V currentValue = dict.get(i).getValue();
            if(currentKey.compareTo(key) == 0){
                return currentValue;
            }
        }
        return null;
    }
    
    // methods must run in O(log2(size())) time.
    public boolean contains(K key){
        for(int i = 0; i < dict.size(); i++){
            K currentKey = dict.get(i).getKey();
            if(currentKey.compareTo(key) == 0){
                return true;
            }
        }
        return false;
    }
    
    public void put(K key, V value){
        for(int i = 0; i < dict.size(); i++){
            Pair<K, V> currentPair = dict.get(i);
            K currentKey = currentPair.getKey();
            V currentValue = currentPair.getValue();
            if(currentKey.compareTo(key) == 0){
                dict.set(i, currentPair);
                return;
            }
            while(){
                
            }
        }
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
