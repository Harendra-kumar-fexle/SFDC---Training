// Question.5 map of state ,CITY AND PERSONS
public with sharing class MapOfStateCityAndPerson {
    public MapOfStateCityAndPerson() {
        Map<String, Map<String, String>> mapOfStateWithCityAndPersonOfIndia = new Map<String, Map<String, String>>();

        // Map of Uttar Pradesh with Person
        Map<String,String> mapOfUttarPradeshWithPerson = new Map<String,String>();
        mapOfUttarPradeshWithPerson.put('Mathura', 'Mohan');
        mapOfUttarPradeshWithPerson.put('Agra', 'Ramesh');
        mapOfUttarPradeshWithPerson.put('Kanpur', 'Neha');
        mapOfUttarPradeshWithPerson.put('Gorakhpur', 'Suraj');
        mapOfUttarPradeshWithPerson.put('Aligarh', 'Kadir');

        // Map of Rajasthan with Person
        Map<String,String> mapOfRajasthanWithPerson = new Map<String,String>();
        mapOfRajasthanWithPerson.put('Jaipur', 'Bhola');
        mapOfRajasthanWithPerson.put('Bharatpur', 'Manoj');
        mapOfRajasthanWithPerson.put('Sikar', 'Yogesh');
        mapOfRajasthanWithPerson.put('Kota', 'Banshi');
        mapOfRajasthanWithPerson.put('Udaipur', 'Raju');

        // Map of Hariyana with Person
        Map<String,String> mapOfHariyanaWithPerson = new Map<String,String>();
        mapOfHariyanaWithPerson.put('Gurugram', 'Vivek');
        mapOfHariyanaWithPerson.put('Panipat', 'Chanchal');
        mapOfHariyanaWithPerson.put('Faridabad', 'Manish');
        mapOfHariyanaWithPerson.put('Sonipat', 'Sachin');
        mapOfHariyanaWithPerson.put('Palwal', 'Kanhaiya');

        // Map of Madhya Pradesh with Person
        Map<String,String> mapOfMadhyaPradeshWithPerson = new Map<String,String>();
        mapOfMadhyaPradeshWithPerson.put('Bhopal', 'Yash');
        mapOfMadhyaPradeshWithPerson.put('Indore', 'Munna');
        mapOfMadhyaPradeshWithPerson.put('Gwalior', 'Akash');
        mapOfMadhyaPradeshWithPerson.put('Bhojpur', 'Santosh');
        mapOfMadhyaPradeshWithPerson.put('Maheshwar', 'Rohit');

        // Map of Himachal Pradesh with Person
        Map<String,String> mapOfHimachalPradeshWithPerson = new Map<String,String>();
        mapOfHimachalPradeshWithPerson.put('Shimla', 'Hema');
        mapOfHimachalPradeshWithPerson.put('Dharamshala', 'Pushpa');
        mapOfHimachalPradeshWithPerson.put('Bilaspur', 'Bittu');
        mapOfHimachalPradeshWithPerson.put('Manali', 'kailash');
        mapOfHimachalPradeshWithPerson.put('Kullu', 'Ram');

        mapOfStateWithCityAndPersonOfIndia.put('Uttar Pradesh', mapOfUttarPradeshWithPerson);
        mapOfStateWithCityAndPersonOfIndia.put('Rajasthan', mapOfRajasthanWithPerson);
        mapOfStateWithCityAndPersonOfIndia.put('Madhya Pradesh', mapOfMadhyaPradeshWithPerson);
        mapOfStateWithCityAndPersonOfIndia.put('Hariyana', mapOfHariyanaWithPerson);
        mapOfStateWithCityAndPersonOfIndia.put('Himachal Pradesh', mapOfHimachalPradeshWithPerson);

        System.debug(mapOfStateWithCityAndPersonOfIndia);
    }
    // Question.1 Account to parent query (Inser record)
    public static void accountToContact() {
        Account acc=new Account(Name='Blog Acc1');
        insert acc;
        System.debug('Account Inserted Successfully.');

        Contact cont=new Contact(FirstName='Bob', LastName='Buzzard', AccountId=acc.id);
        insert cont;
        System.debug('Contact Inserted Successfully.');

    }

    public static void contactToAccount(){
         //Qustion.2 List to Hold Conatcts With Parent Account
		List<Contact> listOfContacts =  [SELECT Id, LastName, AccountId, Account.Name FROM Contact limit 5];
        if(!listOfContacts.isEmpty())
        {
    		for(Contact objContact: listOfContacts)
    		{   
  				system.debug('Account Name'+objContact.Account.Name);
			}
        }
    }
}