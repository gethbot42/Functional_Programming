/*
* StreamExamples.java
*/

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class StreamExamples{
   
   public static void main(String[] args){
      list2Stream();
      mapStringStream();
      filterStringStream();
   }
   
   static void list2Stream(){
      List<Integer> myList = new ArrayList<Integer>();
      myList.add(1);
      myList.add(5);
      myList.add(8);
      
      Stream<Integer> myStream = myList.stream();
      
      //access each element of the stream 
      //like recursive x:xs functions?
      myStream.forEach(e -> System.out.println(e));
   }
   
   static void mapStringStream(){
      String[] myArray = new String[] {"eenie", "meenie", "miney", "mo"};
      Stream<String> myArrayStream = Arrays.stream(myArray);
      
      myArrayStream.map(s -> s.toUpperCase())
                   .forEach(s -> System.out.println(s));
      /*
      String[] myNewArray = myNewStream.toArray(String[]::new);
      
      for(String s : myNewArray){
         System.out.println(s);
      }
      */
   }
   
   static void filterStringStream(){
      String[] myArray = new String[] {"eenie", "meenie", "miney", "mo"};
      
      Arrays.stream(myArray)
            .filter(s -> s.length() > 4)
            .forEach(e -> System.out.println(e));
   }
   
   static void reduceStream(){
      int[] myArray = {1, 5, 8};
      
      System.out.println("Sum: " + Arrays.stream(myArray).sum());
   }
}