interface pocLambda {

    public void implementpoc1();
    public void implementpoc2();
    
}

public class lambdac01 {
    
    public static void main (String args[]) {
        int X =100;

        // implement the interface
        pocLambda p1 = new pocLambda() {
            public void implementpoc1() {
                System.out.println("In the implementpoc1");
            }

            public void implementpoc2() {
                System.out.println("In the implementpoc2");
            }
            
        };

        p1.implementpoc1();
        p1.implementpoc2();

    }
    
}
