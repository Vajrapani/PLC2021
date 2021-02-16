import java.util.Scanner;
import java.util.InputMismatchException;
import java.util.EnumSet;

public class PLTypeEnum
{
    enum PL { JAVA, C, ADA, PYTHON, LISP, HASKELL, PROLOG }
    
    enum PLType { OO, PROCEDURAL, FUNCTIONAL, LOGICAL }
    
    private static <E extends Enum<E>> E getEnumElement(String elementTypeName, Class<E> elementType)
    {
        boolean haveResult = false;
        E result = null;
        Scanner stdin = new Scanner(System.in);
        
        while ( ! haveResult )
        {
            System.out.print("Input " + elementTypeName + ": ");
            try
            {
                result = Enum.valueOf(elementType, stdin.next().toUpperCase());
                haveResult = true;
            }
            catch (IllegalArgumentException e)
            {
                System.out.println("Not a valid " + elementTypeName + ".");
                stdin.nextLine(); // skip the invalid input
            }
        }
        
        return result;
    }
  
    private static PL PLType_to_pl(PLType plt)
    {
        PL name = null;
        
        switch (plt)
        {
        case OO:
            name = PL.JAVA;
            break;
        case PROCEDURAL:
            name = PL.C;
            break;
        case FUNCTIONAL:
            name = PL.HASKELL;
            break;
        case LOGICAL:
            name = PL.PROLOG;
            break;
        }
        
        return name;
    }

    public static void main(String[] args)
    {
        System.out.print("Known PLTypes = ");
        for (PLType t : EnumSet.allOf(PLType.class)) 
        {
            System.out.print(t + " ");
        }
        System.out.println();
        
        PLType plt = getEnumElement("PLTypes : ", PLType.class);
        System.out.println(plt + " LANGUAGE : " + PLType_to_pl(plt));
    }
}
