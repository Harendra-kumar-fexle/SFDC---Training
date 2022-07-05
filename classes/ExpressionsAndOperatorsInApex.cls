public with sharing class ExpressionsAndOperatorsInApex {
    public static void expressionsInApex() {
     Decimal dec = 7*7.0;
     System.debug('Evaluate Decimal Expression = ' + dec);

     String Str1 = 'this Is Apex Expression';
     System.debug(str1);

     Integer add = 4+4;
     System.debug('Evaluate 4+4 = ' + add);

     Account[] aa = [SELECT Id, Name FROM Account WHERE Name ='Acme'];
     Integer i = [SELECT COUNT() FROM Contact WHERE LastName = 'Weissman'];
     List<List<SObject>> searchList = [FIND 'map*' IN ALL FIELDS RETURNING Account (Id, Name),Contact, Opportunity, Lead];
     System.debug(searchList);
    }

     public static void expressionsAndOperators(){
        Integer num1 = 20;
        Integer num2 = 30;
        System.debug('num1 = ' + num1);
        System.debug('num2 = ' + num2);
        String str2 = 'Ramu';
        System.debug('String = ' + str2);

        num1 += num2;
        System.debug('Addition = ' + num1);

        num1 *= num2;
        System.debug('Multiply = ' + num1);

        num1 -= num2;
        System.debug('Subtraction = ' + num1);

        num1 /= num2;
        System.debug('Devision = ' + num1);

        boolean X = true;
        boolean Y = false;
        x |= y;
        System.debug('OR Assignment Operator = ' + x);

        x &= y;                    
        System.debug('And Assignment Operator = ' + x);

        Integer number1 = 20;
        Integer number2 = 3;
        number1 >>= number2;        
        System.debug('Betwise Right Shift Operator = ' + number1);

        number1 = 20;
        number1 <<= number2;    
        System.debug('Betwise Left Shift Operator = ' + number1);

        number1 = 20;
        number1 >>>= number2;     
        System.debug('Betwise Right Shift Unsigned Operator = ' + number1);

        Integer n1 = 20;
        Integer n2 = 30;
        Integer n3 = 40;
        Integer larger = n1 > n2 ? n1 : n2;    
        System.debug('Larger between 20 and 30 = ' + larger);


        //AND logical Operator
        System.debug('(20>30) && (40>30) = ' + (n1>n2 && n3>n2));
        System.debug('(20<30) && (40>30) = ' + (n1<n2 && n3>n2));
        System.debug('(20>30) && (40<30) = ' + (n1>n2 && n3<n2));
        System.debug('(20<30) && (40<30) = ' + (n1<n2 && n3<n2));


        // OR logical Operator
        System.debug('(20>30) OR (40>30) = ' + (n1>n2 || n3>n2));
        System.debug('(20<30) OR (40>30) = ' + (n1<n2 || n3>n2));
        System.debug('(20>30) OR (40<30) = ' + (n1>n2 || n3<n2));
        System.debug('(20<30) OR (40<30) = ' + (n1<n2 || n3<n2));


        // Relational Operator
        Integer[] arr1 = new Integer[]{10,20,30,40,50};
        Integer[] arr2 = new Integer[]{10,20,30,40};
        Integer[] arr3 = new Integer[]{50,40,30,20};
        String s1 = 'Apex';
        String s2 = 'APEX';
        Integer init1 = 20;
        Integer init2 = 50;

        System.debug('arr1 == arr2 ->' + (arr1 == arr2));
        System.debug('arr1 == arr3 ->' + (arr1 == arr3));
        System.debug('arr1 == null ->' + (arr1 == null));
        System.debug('arr1 != null ->' + (arr1 != null));
        System.debug('arr1 == arr2 ->' + (arr1 == arr2));
        System.debug('s1 == s2 ->' + (s1 == s2));

        System.debug('init1 <= init2 ->' + (init1 <= init2));
        System.debug('init1 >= init2 ->' + (init1 >= init2));
        System.debug('arr1 === arr2 ->' + (arr1 === arr2));
        System.debug('init1 != init2 ->' + (init1 != init2));


        System.debug('Post Increment Operator init1++ -> ' + init1++);
        System.debug('After using post increment operator -> ' + init1);

        System.debug('Pre Increment Operator ++init1 -> ' + ++init1);
        System.debug('Pre decrement Operator --init1 -> ' + --init1);

    }


    public static void safeNavigationOperator() {
      String acctName = [SELECT Id, Name FROM Account WHERE Name = 'Kevin'LIMIT 1]?.Name;
      System.debug('This is the account name  ' + acctName);
       
   }


    public static void rulesOfConversion() {
        Long MillsPerYear = 365L * 24L * 60L * 60L * 1000L;
        Long ExpectedValue = 31536000000L;
        System.assertEquals(MillsPerYear, ExpectedValue);
        System.debug('MillsPerYear = ' + MillsPerYear);
        System.debug('ExpectedValue = ' + ExpectedValue);
    }
}