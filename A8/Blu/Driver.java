public class Driver
{
    public static void main(String[] args){
        ArrayDictionary<Integer, String> dict = new ArrayDictionary<Integer, String>();
        Pair<Integer, String> thing2 = new Pair<Integer, String>(20, "Hello");
        Pair<Integer, String> thing1 = new Pair<Integer, String>(10, "world");
        System.out.println(thing2.compareTo(thing1));
        System.out.println(thing1.compareTo(thing2));
    }
}