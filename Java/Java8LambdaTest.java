/*
Java Lambda expressions example:

Java lambda expressions are used primarily to define inline implementation
of a functional interface, i.e., an interface w/ only a single method.
*/
public class Java8LambdaTest{
   
   public static void main(String[] args){
      
      Java8LambdaTest tester = new Java8LambdaTest();
      
      // lambda expresion w/ type declaration
      // left side is an assignment, right side is a lambda expresion
      MathOperation addition = (int a, int b) -> a + b;
      // lambda expresion w/o type declaration
      MathOperation subtraction = (a, b) -> a - b;
      // with a return statement, with curly braces
      MathOperation multiplication = (int a, int b) -> {return a * b;};
      // w/o a return or curly braces
      // same as how addition was defined
      MathOperation division = (int a, int b) -> a / b;
      
      System.out.println("10 + 5 = " + tester.operate(10, 5, addition));
      System.out.println("10 - 5 = " + tester.operate(10, 5, subtraction));
      System.out.println("10 * 5 = " + tester.operate(10, 5, multiplication));
      System.out.println("10 / 5 = " + tester.operate(10, 5, division));
      
      // Override the sayMessage method of GreetingService using
      // a lambda expression w/o parenthesis around input param
      GreetingService greetService1 = message ->
      System.out.println("Hello, " + message);
      // with parenthesis around input param -- same result
      GreetingService greetService2 = (message) ->
      System.out.println("Welcome, " + message);
      
      greetService1.sayMessage("Annabel");
      greetService2.sayMessage("Todd");
      
   }
   
   // functional interfaces - single method only
   interface MathOperation{
      int operation(int a, int b);
   }
   
   interface GreetingService{
      void sayMessage(String message);
   }
   
   private int operate(int a, int b, MathOperation mathOperation){
      return mathOperation.operation(a, b);
   }
}