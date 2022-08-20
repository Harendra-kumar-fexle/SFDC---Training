public with sharing class ContactTriggerHelper {

    public static void populateAccountOnContact(List<Contact> conList) {

        Set<Id> setOfIds = new Set<Id>();
        for(Contact con : conList) {
            setOfIds.add(con.AccountId);
        }
        List<Account> accList = [Select Id, Name, Status__c, Property__c From Account Where Id In: setOfIds];
        System.debug('accList ==> ' + accList);
        
        
        
        // Map of Account
        Map<Id, Account> mapOfAcc = new Map<Id, Account>();
        mapOfAcc.putAll(accList);
        System.debug('mapOfAcc ==> ' + mapOfAcc);
        for(Contact con : conList) {
            If(con.Status__c == null) {
                Account acc = mapOfAcc.get(con.AccountId);
                If(acc.Status__c != null) {
                    con.Status__c = acc.Status__c;
                } 
            }
        }
    }
}