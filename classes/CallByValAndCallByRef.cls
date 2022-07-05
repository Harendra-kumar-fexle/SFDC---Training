public with sharing class CallByValAndCallByRef {
    public void callByValue() {
        String str = 'Original value';
        System.debug('Before calling -> ' + str);
        processCallByValue(str);
        System.debug('After calling -> ' + str);
    }

    public void processCallByValue(String s) {
        s = 'Modified Value';
        System.debug('Inside call by value method -> ' + s);
    }

    public void callByReference() {
        List<Integer> fillMe = new List<Integer>();
        System.debug('Original List -> ' + fillMe);
        reference(fillMe);
        referenceNew(fillMe);
        System.debug('After calling -> ' + fillMe);
    }

    public void reference(List<Integer> firstList) {
        firstList.add(10);
        firstList.add(20);
        firstList.add(30);
        firstList.add(40);
        firstList.add(50);
        System.debug('After calling refrence method First List -> ' + firstList);
    }

    Public void referenceNew(List<Integer> secondList){
        secondList.add(60);  
        secondList.add(70);
        secondList.add(80);
        secondList.add(90);
        secondList.add(100);
        System.debug('After calling refrenceNew Second List -> ' + secondList);
    }
}