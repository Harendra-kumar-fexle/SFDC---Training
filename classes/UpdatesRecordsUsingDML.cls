public with sharing class UpdatesRecordsUsingDML {
    public static void updateRecord() {
        List<Contact> conList = [Select Department , Description from Contact];
        for(Contact badCon : conList) {
            if (badCon.Department == 'Finance') {
                badCon.Description = 'New description';
            }
            // Not a good practice since governor limits might be hit.
            update badCon;
        }
        System.debug('record Update Successfully');
    }

    public static void updateRecords(){
        // List to hold the new contacts to update.
        List<Contact> updatedList = new List<Contact>();
        List<Contact> conList = [Select Department , Description from Contact];
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Description = 'New description';
                // Add updated contact sObject to the list.
                updatedList.add(con);
            }
        }
            // Call update on the list of contacts.
            // This results in one DML call for the entire list.
            update updatedList;
            System.debug('record Update Successfully');
    }

    public static void updateAccount(){
            // Query existing account.
            Account a = [SELECT Name,Industry 
            FROM Account 
            WHERE Name='Account Example' LIMIT 1];

            // Write the old values the debug log before updating them.
            System.debug('Account Name before update: ' + a.Name); // Name is Account Example
            System.debug('Account Industry before update: ' + a.Industry);// Industry is not set

            // Modify the two fields on the sObject.
            a.Name = 'Account of the Day';
            a.Industry = 'Technology';

            // Persist the changes.
            update a;

            // Get a new copy of the account from the database with the two fields.
            Account b = [SELECT Name,Industry 
            FROM Account 
            WHERE Name='Account of the Day' LIMIT 1];

            // Verify that updated field values were persisted.
            System.assertEquals('Account of the Day', a.Name);
            System.assertEquals('Technology', a.Industry);
            System.debug(b);
        }

        public static void insertingRelatedRecords(){
            try {
                Account acct = new Account(Name='SFDC Account');
                insert acct;
            
                // Once the account is inserted, the sObject will be 
                // populated with an ID.
                // Get this ID.
                ID acctID = acct.ID;
            
                // Add a contact to this account.
                Contact con = new Contact(FirstName='Joe', LastName='Smith', Phone='415.555.1212', AccountId=acctID);
                insert con;
                System.debug(con);
            } catch(DmlException e) {
                System.debug('An unexpected error has occurred: ' + e.getMessage());
            }
        }
    

    public static void updatingRelatedRecords(){
        try {
            // Query for the contact, which has been associated with an account.
            Contact queriedContact = [SELECT Account.Name FROM Contact WHERE FirstName = 'Joe' AND LastName='Smith' LIMIT 1];
        
            // Update the contact's phone number
            queriedContact.Phone = '415.555.1213';
        
            // Update the related account industry
            queriedContact.Account.Industry = 'Technology';
        
            // Make two separate calls 
            // 1. This call is to update the contact's phone.
            update queriedContact;
            // 2. This call is to update the related account's Industry field.
            update queriedContact.Account; 
            System.debug(queriedContact);
        } catch(Exception e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
  }