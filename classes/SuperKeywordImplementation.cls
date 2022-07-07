public with sharing virtual class SuperKeywordImplementation {
    public String mySalutation;
    public String myFirstName;
    public String myLastName;

    // default constructor of this clss
    public SuperKeywordImplementation() {
        mySalutation = 'Mr.';
        myFirstName = 'Carl';
        myLastName = 'Vonderburg';
        printName();
    }

    public SuperKeywordImplementation(String salutation, String firstName, String lastName) {
        mySalutation = salutation;
        myFirstName = firstName;
        myLastName = lastName;
        printName();
    }

    public virtual void printName() {

        System.debug('My name is ' + mySalutation + myLastName);
    }

   public virtual String getFirstName() {
       return myFirstName;
   }
}