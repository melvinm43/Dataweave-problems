interface pocLambda02 {

    public void implementpoc1();
    // public void implementpoc2();
    
}

public class lambdac02 {
    
    public static void main (String args[]) {
        int X =100;

        // implement the interface
        pocLambda02 p1 = () -> System.out.println("Implemented Lambda expression " +X);

        p1.implementpoc1();

    }
    
}
