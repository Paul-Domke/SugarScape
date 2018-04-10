public class Pair<K extends Comparable<K>,V> implements Comparable<Pair<K,V>>{
    K key;
    V value;
    
    public Pair(K key, V value){
        //Initializes a new Pair<K,V> object, storing the given data.
        this.key = key;
        this.value = value;
    }
    
    public K getKey(){
        //Returns the K data stored in this Pair.
        return key;
    }
    
    public V getValue(){
        //Returns the V data stored in this Pair.
        return value;
    }
    
    public int compareTo(Pair<K,V> other){
        //Returns the result of comparing the K values of this 
        //and other using the compareTo() methods of the K data type. 
        //The fact that class K is restricted to types that implement the 
        //comparable interface ensures that compareTo() exists.
        return this.key.compareTo(other.getKey());
    }
}
