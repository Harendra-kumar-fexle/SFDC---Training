public with sharing class ParentChildClass {
        public static void InsertParentChild() {
            Date dt = Date.today();
            dt = dt.addDays(7);
            Opportunity newOpportunity = new Opportunity(
            Name='OpportunityWithAccountInsert',
            StageName='Prospecting',
            CloseDate=dt);
            
            // Create the parent reference.
            // Used only for foreign key reference
            // and doesn't contain any other fields.
            Account accountReference = new Account(Id = '0015i00000AgBFEAA3');                
            newOpportunity.Account = accountReference;
            
            // Create the Account object to insert.
            // Same as above but has Name field.
            // Used for the insert.
            Account parentAccount = new Account(Name='Hallie',Id ='0015i00000AgBFEAA3');      
            
            // Create the account and the opportunity.
            Database.SaveResult[] results = Database.insert(new SObject[] { parentAccount, newOpportunity });
            
            // Check results.
            for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: ' + results[i].getId());
            } else {
            System.debug('Error: could not create sobject ' + 'for array element ' + i + '.');
            System.debug(' The error reported was: ' + results[i].getErrors()[0].getMessage() + '\n');
                }
            }
        }

        public static void upsertingRecords() {
           Account[] acctsList = [SELECT Id, Name, BillingCity FROM Account WHERE BillingCity = 'Bombay'];
            for (Account a : acctsList) {
            a.BillingCity = 'Mumbai';
            }
            Account newAcct = new Account(Name = 'Acme', BillingCity = 'San Francisco');
            acctsList.add(newAcct);
            try {
            upsert acctsList;
            } catch (DmlException e) {
            System.debug(e);
       }
    }
}