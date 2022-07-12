public with sharing class ListMapSetMethodsInApex {

//Question.4
    public static void listMethod() {
        List<Integer> myList = new List<Integer>();
        myList.add(47);
        myList.add(50);
        Integer myNumber = myList.get(0);
        System.debug('List -> ' + myList);

        myList.add(1,10);
        System.debug('Add 10 At index 1 -> ' + myList);
        Boolean b = mylist.contains(2);
        System.debug(b);
        myList.clear();
        System.debug('clear list -> ' + myList);

        List<Integer> ls1 = new List<Integer>();
        ls1.add(1);
        ls1.add(2);
        // Create a list based on an existing one
        List<Integer> ls2 = new List<Integer>(ls1);
        // ls2 elements are copied from ls1
        System.debug(ls2);

        Set<Integer> s1 = new Set<Integer>();
        s1.add(1);
        s1.add(2);
        // Create a list based on a set
        List<Integer> ls = new List<Integer>(s1);
        // ls elements are copied from s1
        System.debug(ls);

        List<String> myStrings = new List<String>{'a', 'b'};
        Boolean result = myStrings.contains('z');
        System.assertEquals(false, result);

    }

    public static void containsKey() {
        Map<String, String> colorCodes = new Map<String, String>();

        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');

        Boolean contains = colorCodes.containsKey('Blue');
        System.assertEquals(true, contains);
        System.debug('Map hold the blue color -> ' + contains);
    }

    public static void clone() {
        Account a = new Account(Name='Acme', BillingCity='New York');

        Map<Integer, Account> map1 = new Map<Integer, Account> {};
        map1.put(1, a);

        Map<Integer, Account> map2 = map1.clone(); // make the clone of map1 and hold it in map2. 
        map1.get(1).BillingCity = 'San Francisco';

        System.assertEquals('San Francisco', map1.get(1).BillingCity);

        System.assertEquals('San Francisco', map2.get(1).BillingCity);
    }


    public static void hashCode() {
        Map<String,String> mapOfStringWithString = new Map<String,String>();
        mapOfStringWithString.put('IND','INDIA');
        System.debug('HashCode -> ' + mapOfStringWithString.hashCode());

    }

    public static void isEmpty() {
        Map<String, String> colorCodes = new Map<String, String>();
        Boolean empty = colorCodes.isEmpty();
        System.assertEquals(true, empty);
        System.debug('Map is empty -> ' + colorCodes.isEmpty());
   }


    public static void parameters(){
        Map<Integer, String> m1 = new Map<Integer, String>();
        m1.put(1, 'First item');
        m1.put(2, 'Second item');
        Map<Integer, String> m2 = new Map<Integer, String>(m1);
        System.debug(m2);
    }


    public static void setMethod(){
        Set<String> s1 = new Set<String>();
        s1.add('item1');
        s1.add('item2');
        Set<String> s2 = new Set<String>(s1);
        System.debug(s2);

        Set<String> myString = new Set<String>{'a', 'b'};
        Set<String> sString = new Set<String>{'c'};

        Boolean result1 = myString.addAll(sString);
        System.assertEquals(true, result1);
        System.debug(result1);
        myString.clear();
        System.debug(myString);

        Boolean b = myString.equals(sString);
        System.debug(b);

        Set<String> myString1 = new Set<String>{'a', 'b'};
        Boolean result2 = myString1.contains('z');
        System.assertEquals(false, result2);
        
        Set<Integer> mySet = new Set<Integer>();
        Boolean result3 = mySet.isEmpty();
        System.assertEquals(true, result3);
        System.debug(result3);
    }
}