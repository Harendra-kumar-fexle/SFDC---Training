public with sharing class OuterAndInnerClassInApex {
    public class innerClassInApex {
        public void multiply() {
            Integer x = 20;
            Integer y = 30;
            System.debug('Multiplication = ' + (x * y));
        }
    } 
    public void executeInnerClass() {
        innerClassInApex ic = new innerClassInApex();
        ic.multiply();
    }

    private static Integer MY_INT; 
    
    public static void showVariables() {
        Integer i = 1;
        System.debug(i);
        Integer x = 10;
        Integer y = 20;
        System.debug('Addition = ' + (x+y));
        OuterAndInnerClassInApex.MY_INT = 10 ;
        System.debug(MY_INT);
    }
}