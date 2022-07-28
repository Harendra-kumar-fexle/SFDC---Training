public with sharing class CollectionsExample {
    public static void aboutListsInApex() {

        // Create an empty list of String
        List<String> myList1 = new List<String>();
        myList1.add('Harendra');
        myList1.add('Sachin');
        myList1.add('Rakhi');
        myList1.add('Suresh');
        System.debug('List 1 Element -> ' + myList1);
   
        // Create a nested list
        List<String> myList2 = new List<String>();
        myList2.add('Delhi');
        myList2.add('America');
        myList2.add('India');
        System.debug('List 2 Element -> ' + myList2);
        System.debug('Add Raj at Index 1 -> ' + myList1);
   
        //contains(listElement)
        List<String> myStrings = new List<String>{'a', 'b'};
        Boolean result = myStrings.contains('z');
        System.assertEquals(false,result);
        System.debug('Element in the list -> ' + myStrings);
        System.debug('List contains z or Not -> ' + result);
        
        //equals(list2)
        
   
   
        
        System.debug('Both of the string are Equal or Not -> ' + result);
   
        SObject sObj = Database.query('SELECT ID FROM Account LIMIT 1');
   
        //Veryfy if that sObjects variable is an Account token.
        System.assertEquals(
        Account.sObjectType, sObj.getSObjectType());
   
        //create a list of generic sObjects.
        List<sObject> q = new Account[]{};
    }
   
   
    public static void aboutSetsInApex() {
   
        Set<String> myStringSet = new Set<String>();
   
        // Defines a new set with two elements
        Set<String> set1 = new Set<String>{'New York', 'Paris'};
        System.debug(set1);
   
        // Define a new set
        Set<Integer> mySet = new Set<Integer>();
        // Add two elements to the set
        mySet.add(1);
        mySet.add(3);
        // Assert that the set contains the integer value we added
        System.assert(mySet.contains(1)); 
        // Remove the integer value from the set
        mySet.remove(1);
        System.debug(mySet);
   
        // Define a new set that contains the
        // elements of the set created in the previous example
        Set<Integer> mySet2 = new Set<Integer>(mySet);
        // Assert that the set size equals 1
        // Note: The set from the previous example contains only one value
        System.assert(mySet2.size() == 1);
        System.debug('The size of mySet is: ' + mySet2);
    }
   
    
   
    public static void aboutMapsInApex() {
        Map<String, String> country_currencies = new Map<String, String>();
        Map<ID, Set<String>> m = new Map<ID, Set<String>>();
   
        Map<String, String> MyStrings = new Map<String, String>{'a' => 'b'.toUpperCase(), 'c' => 'd'.toUpperCase()};
        System.debug(myStrings);
   
        Map<Integer, String> m1 = new Map<Integer, String>(); // Define a new map
        m1.put(1, 'First entry');                               // Insert a new key-value pair in the map
        m1.put(2, 'Second entry');                              // Insert a new key-value pair in the map
        System.assert(m1.containsKey(1));                       // Assert that the map contains a key
        String value = m1.get(2);                               // Retrieve a value, given a particular key
        System.assertEquals('Second entry', value);
        Set<Integer> s = m1.keySet();                           // Return a set that contains all of the keys in the map
        System.debug(m1);      
   
   
        Map<String, String> colorCodes1 = new Map<String, String>();
   
        colorCodes1.put('Black', 'FF0000');
        colorCodes1.put('White', '0000A0');
   
        Integer mSize = colorCodes1.size();
        System.assertEquals(2, mSize);
        System.debug('The size of map is: ' + msize);
   
   
        Map<String, String> colorCodes2 = new Map<String, String>();
   
        colorCodes2.put('Black', 'FF0000');
        colorCodes2.put('White', '0000A0');
   
   
        List<String> colors = new List<String>();
        colors = colorCodes2.values();
        System.debug('The values inside the Map are: ' + colors);
    }
}