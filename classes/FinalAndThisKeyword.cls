public with sharing class FinalAndThisKeyword {
    private static final Integer num = 30;
    private static final Double gf = 9.8;

    public void finalKeyword() {
        Integer num2 = 50;
        System.debug('Local variable -> ' + num2);
        System.debug('final variable -> ' + gf);
        // gf = 50;   it will generate a error , because final variable is used for making constant value.
        System.debug('Final variable -> ' + gf);

    }

    Boolean bl = true;
    public void thisKeyword() {
        Boolean bl = false;
        System.debug('Using this keyword -> ' + this.bl);
        System.debug('Without Using this keyword -> ' + bl);
    }
}