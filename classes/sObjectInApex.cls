public with sharing class sObjectInApex {
    public void instanceOfKeyword() {
      Sobject s = new Account();
      // This one is correct typecasting
      Account a = (Account)s;

      // In is wrong, Run Time Error
      //Contact c = (Contact); 
       
      if (s instanceOf Account) {
        Account acc = (Account)s;
      } else if (s instanceOf Contact) {
          Contact c = (Contact)s;
      }
    }

    public void insertData() {
      Account acc1 = new Account();
      //Property Initialization or Field Initialization 

      //Type-1
      acc1.Name = 'Ankit';
      acc1.AccountNumber = '124';
      acc1.Phone = '9627333671';
      System.debug('Record-1 inserted successfully');

      //Type-2 
      Account acc2 = new Account(Name = 'Gopal', AccountNumber = '122', Phone = '9758563342');  
      
      //Insert
      insert acc2;
      System.debug('Record-2 inserted successfully');

      sObject acc3 = new Account();
      acc3.put('Name', 'Harendra');
      acc3.put('Phone', '9758636276');
      acc3.put('AccountNumber','234');

      //Insert
      insert acc3;
      System.debug('Record-3 inserted successfully');
    }

    public void typeCasting() {
      Account a = new Account(Name = 'Acme', BillingCity = 'San Francisco');
      insert a;
      sObject s = [SELECT Id, Name FROM Account WHERE Name = 'Acme' LIMIT 1];
      ID id = s.ID;
      Account convertedAccount = (Account)s;
      convertedAccount.name = 'Acme2';
      update convertedAccount;
      Contact sal = new Contact(FirstName = 'Sal', Account = convertedAccount);
    
    }
  
}