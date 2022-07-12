public with sharing class ListOfAccountAndContact {
    public static void listOfAccount() {
        List<String> listAcc = new List<String>();
        List<Account> acc = [Select Name, Phone From Account LIMIT 2];
        System.debug('Selected items is-> ' + acc);

    }

    public static void listOfContact() {
        List<Contact> listCon = new List<Contact>();
        List<Contact> con = [Select Id, FirstName, LastName, Pan_Number__c, Phone From Contact LIMIT 2];
        System.debug(con);
    }
}