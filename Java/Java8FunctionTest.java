/*
Java8FunctionTest

*/
import java.util.function.Function; // import the Function interface
// Or just do this // import java.util.function.*;

public class Java8FunctionTest
{
    public static Integer compute(Function<Integer, Integer> function, Integer value) 
    {
	return function.apply(value);
    }

             // Simple invert method
    private static Integer invert(Integer value) 
    {
        return -value;
    }
        
    public static void main(String[] args)
    {
	Integer inp = 5;

	// Instantiate a Function object 'invertFunction' and assign a method reference (invert):
Function<Integer, Integer> invertFunction = Java8FunctionTest::invert;

// Pass invertFunction as an argument to compute along with inp:
System.out.println( compute(invertFunction, inp) );
    }
}
