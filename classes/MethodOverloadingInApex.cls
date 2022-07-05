public with sharing class MethodOverloadingInApex {

    private static final Integer defaultSize = 10;

    Integer size;
    // Constructor Overloading
    public MethodOverloadingInApex() {
        System.debug(defaultSize);
    }

    public MethodOverloadingInApex(Integer objectSize) {
        size = objectSize;
        System.debug(size);
    }


    // Method Overloading in Apex
    public void methodOverloading() {
        Integer x = 10;
        Integer y = 20;
        System.debug('Subtraction = ' + (x-y));
    }

    public void methodOverloading(Integer radius) {
        System.debug('Area of Circle ' + (3.14*radius*radius));
    }

    public void methodOverloading(String str) {
        System.debug('Given String Is - > ' +str);
        System.debug('Length of String -> ' +(str.length()));
    }

}