import java.util.*;
public class Replacer{ 
   public static void main(String[] args){
       Scanner s = new Scanner(System.in);
       int count = 0;
       String key = "";
       String value = "";
       ArrayDictionary<String, String> dict = new ArrayDictionary<String, String>();
       ArrayList<String> words = new ArrayList<String>();
       
       while(s.hasNext()){
            String n = s.next();
            if(n.equals("done")){
               break;
            }
            if(count == 1){
               value = n;
               dict.put(key, value);
               count = -1;
            }
            if(count == 0){
               key = n;
            }
            count++;
       }
        
       while(s.hasNext()){ 
           String n = s.next();
           if(n.equals("DONE")){
               break;
            }
           words.add(n);
       }
       
       for(String w : words){
           if(dict.contains(w) == true){
               System.out.println("Im here!");
               int i = words.indexOf(w);
               words.set(i, dict.get(w));
            }
       }
        
       for(int i = 0; i < words.size(); i++){
           System.out.print(words.get(i) + " ");
       }
       
       System.out.println();
   }
}
