import java.util.ArrayList;
import java.util.Collections;
public class ArrayDictionary<K extends Comparable<K>, V> implements Dictionary<K,V>{
    ArrayList<Pair<K, V>> dict;
    
    public ArrayDictionary(){
        dict = new ArrayList<Pair<K, V>>();
    }
    
    public void clear(){
        dict = new ArrayList<Pair<K, V>>();
    }
    
    public int size(){
        return dict.size();
    }
    
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
        int start = 0;
        int end = dict.size();
        while(start != end){
            int middle = (end - start)/2;
            Pair<K, V> currentPair = dict.get(middle);
            if(key.compareTo(currentPair.getKey()) == 0){
                return currentPair.getValue();
            }
            if(key.compareTo(currentPair.getKey()) < 0){
                start = middle + 1;
            }
            if(key.compareTo(currentPair.getKey()) > 0){
                end = middle;
            }
        }
        return null;
    }
    
    public boolean contains(K key){
        int start = 0;
        int end = dict.size();
        while(start != end){
            int middle = start + end/2;
            int comp = dict.get(middle).getKey().compareTo(key);
            if(comp == 0){
                return true;
            }
            if(comp < 0){
                start = middle + 1;
            }
            if(comp > 0){
                end = middle;
            }
        }
        return false;
    }
    
    public void put(K key, V value){
        Pair<K,V> temp = new Pair<K,V>(key, value);
        if(dict.size() == 0){
            dict.add(temp);
            return;
        }
        for(int i = 0; i < dict.size(); i++){
            Pair<K, V> currentPair = dict.get(i);
            K currentKey = currentPair.getKey();
            if(currentKey.compareTo(key) == 0){
                dict.set(i, temp);
                return;
            }
            if(key.compareTo(currentKey) > 0){
                dict.add(temp);
                return;
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
        for(Pair currentPair : data){
            dict.add(currentPair);
        }
        Collections.sort(dict);
    }
}
