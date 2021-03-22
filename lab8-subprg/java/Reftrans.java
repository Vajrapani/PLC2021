import java.util.List;
import java.util.ArrayList;

public class Reftrans
{

    private static void initialiseList(List<Integer> l)
    {
        // let l be [0,1,2,3]
        l.clear();
        l.add(0);
        l.add(1);
        l.add(2);
        l.add(3);
    }

    public static void main(String[] args)
    {
        List<Integer> list;

        // create a list:
        list = new ArrayList<Integer>();
        initialiseList(list);
	
        //1 and 3
        int result1 =
            list.get(1) + list.get(3); // now referentially transparent?
        // TASK 8.2 (a): rewrite the above 2 lines using referentially transparent expressions

        // create exactly the same lists as before:
        list = new ArrayList<Integer>();
        initialiseList(list);
	
	//2 and 1
        int result2 =
            list.get(2) + list.get(1); // now referentially transparent?
        // TASK 8.2 (a): rewrite the above 2 lines using referentially transparent expressions

        System.out.println("result1 = " + result1);
        System.out.println("result2 = " + result2);
    }

}
