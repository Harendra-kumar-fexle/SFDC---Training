public with sharing class SubClassForSuperKeyword extends SuperKeywordImplementation{
    
    public override void printName() {
        super.printName();
        System.debug('But you can call me ' + super.getFirstName());
    }

    // default constructor
    public SubClassForSuperKeyword() {
        super();
    }

    public SubClassForSuperKeyword(String salutation, String firstName, String lastName) {
        super(salutation , firstName , lastName);
        
    }

    public static void instanceOfKeyword() {
        sObject s = new Account ();


        //This one is correct typecasting 
        Account a = (Account)s;

        //It is wrong, Run Time Error 
        Contact b = (Contact)s;


        if (s instanceOf Account)
        Account c = (Account)s;
        else if (s instanceOf Contact)
        Contact d = (Contact)s;
}
}