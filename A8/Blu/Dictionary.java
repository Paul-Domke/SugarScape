public interface Dictionary<K,V>{
    public void put(K key, V value);
    //Inserts key into the dictionary with the specified value associated. 
    //If key is already present(determined using compareTo() == 0), 
    //overwrite the old value with the new value.
    
    public boolean contains(K key);
    //Returns true if and only if key is already in the dictionary. 
    
    public V get(K key);
    //Returns whatever V object is stored in the dictionary under key 
    //(determined using compareTo() ==0). 
    //Returns null if key is not stored in the dictionary.
    
    public V remove(K key);
    //Returns whatever V object is stored in the dictionary under key 
    //(determined using compareTo() ==0) 
    //and deletes that object from the dictionary (subsequent calls to get(key)should return null). 
    //If key is not in the dictionary, this method should throw an AssertionError or NullPointerException.
    
    public int size();
    //Returns the number of elements stored in the dictionary.
    
    public void clear();
    //Erases all elements stored in the dictionary.
}
