public with sharing class DataTypesAndVariables {
    public static void PracticeDataType() {
        // 1.Integer -> It is used for store Integer number.
         Integer radius = 20;
        System.debug('The Area Of Circle Is ' + 3.14*radius*radius);
     
        // Decimal -> It is used for store any floating point value.
        Decimal percentage = 80.5;
        System.debug('You Are First Devision: ' + percentage);
     
        // Double -> It is used for store large floating point numbers as compare to Decimal.
        Double d = 3.14150;
        System.debug('Double is ' + d);
           
        // String -> It is used for store sequence of characters in a single variable.
        String name = 'Harendra kumar';
        String password = 'Harendra1245';
        System.debug('UserName Is ' + name);
     
        // Long -> It is used for store large amount of data.
        Long l = 2147483648L;
        System.debug('Long number is ' + l);
     
        // Boolean -> It is used for store only two values 'true' and 'false'.
        Boolean indiaIsWinner = true;
        Boolean pakIsWinner = false;
        System.debug('India is Winner Or Not ? ' + indiaIsWinner);
     
        // ID -> It is used to set the id as 15 character values.
        ID id='00300000003T2PGAA0';
        System.debug('ID is ' + id);
     
        // Object 
        Object obj = 10;
        // Cast the object to an integer.
        Integer obj1 = (Integer)obj;
        System.assertEquals(10, obj1);
        System.debug('Object change in Integer ' + obj1);
     
        // Blob -> It is used for store collection of binary data.
        String str = 'This is Blob datatype';
        Blob b = Blob.valueOf(str);
        String s1 = b.toString();
        System.debug(b);
     
        // Date -> It is used for display current date or date.
        Date d1;
        d1 = Date.today();
        System.debug('Current Date is ' + d1);
     
        // DateTime -> It is used for display the date and time.
        DateTime dt;
        dt = DateTime.now(); 
        System.debug('Current Date and time is ' + dt);
    }

     Public static void  learndateClassMethods() {

       System.debug('********addDays()********');

        Date myDate1 = Date.newInstance(1960, 2, 17);
        Date newDate1 = mydate1.addDays(2);
        System.debug('current date is ' + mydate1);
        System.debug('After adding 2 day ' + newDate1);


        System.debug('*********AddMonths()********');


        date myDate2 = date.newInstance(1990, 11, 21);
        date newDate2 = myDate2.addMonths(3);
        date expectedDate2 = date.newInstance(1991, 2, 21);
        System.assertEquals(expectedDate2, newDate2);
        System.debug('current date is ' + myDate2);
        System.debug('After adding 3 months ' + newDate2);

        System.debug('********AddYear()*******');

        date myDate3 = date.newInstance(1983, 7, 15);
        date newDate3 = myDate3.addYears(2);
        date expectedDate3 = date.newInstance(1985, 7, 15);
        System.assertEquals(expectedDate3, newDate3);
        System.debug('current date is ' + mydate3);
        System.debug('After adding 2 year ' + newDate3);

        System.debug('********day()*******');

        date myDate4 = date.newInstance(1989, 4, 21);
        Integer day1 = myDate4.day();
        System.assertEquals(21, day1);
        System.debug('current date is ' + myDate4);
        System.debug('The Number of days are ' + day1);

        System.debug('********dayofYear()********');

        date myDate5 = date.newInstance(1998, 10, 21);
        Integer day2 = myDate5.dayOfYear();
        System.assertEquals(294, day2);
        System.debug('current date is '+ myDate5);
        System.debug('The dayofYear are ' + day2);

        System.debug('********daysBetween(SecondDate)()******');

        Date startDate6 = Date.newInstance(2008, 1, 1);
        Date dueDate6 = Date.newInstance(2008, 1, 30);
        Integer numberDaysDue = startDate6.daysBetween(dueDate6);
        System.debug('current date is ' + startDate6);
        System.debug('The startDate of DaysBetween '+ numberDaysDue); 

        System.debug('*********DaysInMonth(Year,Month)()********');

        Integer numberDays3 = date.daysInMonth(1960, 2);
        System.debug('The Number Of daysInMonth ' + numberDays3);


        System.debug('********format()********');

        // In American-English locale
        date myDate7 = date.newInstance(2001, 3, 21);
        String dayString = myDate7.format();
        System.assertEquals('3/21/2001', dayString);
        System.debug('current date is' + myDate7);
        System.debug('The number of dayString ' + dayString);
        } 

        public static void learnDateTimeClassMethods() {

            System.debug('**********addDays()***********');

            // addDays(additionalDays)
            Datetime myDateTime1 = Datetime.newInstance(1960, 2, 17);
            Datetime newDateTime1 = myDateTime1.addDays(2);
            Datetime expected1 = Datetime.newInstance(1960, 2, 19);
            System.assertEquals(expected1, newDateTime1);
            System.debug('Let suppose current DateTime is ' + myDateTime1);
            System.debug('After Adding 2 Days ' + newDAteTime1);
    
            System.debug('*********addHours()*********');
    
            // addHours(additionalHours)
            DateTime myDateTime2 = DateTime.newInstance(1997, 1, 31, 7, 8, 16);
            DateTime newDateTime2 = myDateTime2.addHours(3);
            DateTime expected2 = DateTime.newInstance(1997, 1, 31, 10, 8, 16);
            System.assertEquals(expected2, newDateTime2);
            System.debug('Let suppose current DateTime is ' + myDateTime2);
            System.debug('After Adding 3 Hours ' + newDateTime2);
    
            System.debug('*********addMonths()**********');
    
            //addMonths(additionalMonths)
            DateTime myDateTime3 = DateTime.newInstance(2000, 7, 7, 7, 8, 12);
            DateTime newDateTime3 = myDateTime3.addMonths(1);
            DateTime expected3 = DateTime.newInstance(2000, 8, 7, 7, 8, 12);
            System.assertEquals(expected3, newDateTime3);
            System.debug('Let suppose Current DateTime is ' + myDateTime3);
            System.debug('After Adding 1 month ' + newDateTime3);
    
            System.debug('**********addYears()**********');
    
            //addYears(additionalYears)
            DateTime myDateTime4 = DateTime.newInstance(2009, 12, 17, 13, 6, 6);
            DateTime newDateTime4 = myDateTime4.addYears(1);
            DateTime expected4 = DateTime.newInstance(2010, 12, 17, 13, 6, 6);
            System.assertEquals(expected4, newDateTime4);
            System.debug('Let suppose current DateTime is ' + myDateTime4);
            System.debug('After Adding 1 year ' + newDateTime4);
    
            System.debug('**********hours()***********');
    
            // hours()
            DateTime myDateTime5 = DateTime.newInstance(1998, 11, 21, 3, 3, 3);
            System.assertEquals(3 , myDateTime5.hour());
            System.debug(myDateTime5);
    
            System.debug('**********newInstance(date,time)*********');
    
            Date myDate1 = Date.newInstance(2011, 11, 18);
            Time myTime1 = Time.newInstance(3, 3, 3, 0);
            DateTime dt1 = DateTime.newInstance(myDate1, myTime1);
            DateTime expected5 = DateTime.newInstance(2011, 11, 18, 3, 3, 3);
            System.assertEquals(expected5, dt1);
            System.debug('Let suppose Date is ' + myDate1);
            System.debug('Let suppose Time is ' + myTime1);
            System.debug('After combine Date and Time ' + dt1);
    
            System.debug('*********newInstance(Year,month,day,hour,minute,second)********');
    
            Datetime myDate2 = Datetime.newInstance(2008, 12, 1, 12, 30, 2);
            System.debug('Year,month,day,hour,minute,second ' + myDate2);
    
            System.debug('**********isSameDay(dateToCompare)***********');
    
            datetime myDate3 = datetime.now();
            datetime dueDate1 = datetime.newInstance(2008, 1, 30);
            boolean dueNow = myDate3.isSameDay(dueDate1);
            System.debug('Current Date is: ' + myDate3);
            System.debug('DueDate is: ' + dueDate1);
            System.debug('After using isSameDay method: ' + dueNow);
    
            System.debug('**********year()***********');
    
            // year()
            DateTime dt2 = DateTime.newInstance(2012, 1, 26, 5, 2, 4);
            System.assertEquals(2012, dt2.year());
            System.debug('Let suppose Current DateTime Is: ' + dt2);
            System.debug('After using year method we got: ' + dt2.year());
    
            System.debug('***********valueOf(fieldValue)***********');
    
            // valueOf(fieldValue)
            List<AccountHistory> ahlist = [SELECT Field,OldValue,NewValue FROM AccountHistory];
            for(AccountHistory ah : ahlist) {
             System.debug('Field: ' + ah.Field);
             if (ah.field == 'MyDatetime__c') {
             Datetime oldValue = Datetime.valueOf(ah.OldValue);
             Datetime newValue = Datetime.valueOf(ah.NewValue);
                }
            }
        }

        public static void learnStringClassMethod() {

            System.debug('*********abbreviate(maxWidth)***********');

            // abbreviate(maxWidth)
            String s1 = 'Hello Maximillian';
            String s2 = s1.abbreviate(8);
            System.assertEquals('Hello...', s2);
            System.assertEquals(8, s2.length());
            System.debug(s2);
    
            System.debug('***********abbreviate(maxWidth,offset)*********');
    
            // abbreviate(maxWidth,offset)
            String s3 = 'Hello Maximillian';
            // Start at M
            String s4 = s3.abbreviate(9,6);
            System.assertEquals('...Max...', s4);
            System.assertEquals(9, s4.length());
            System.debug('The String is: ' + s3);
            System.debug('After using Method: ' + s4);
    
            System.debug('**********capitalize()**********');
    
            // capitalize()
            String s5 = 'hello maximillian';
            String s6 = s5.capitalize();
            System.assertEquals('Hello maximillian', s6);
            System.debug('The String Is: ' + s5);
            System.debug('After using method: ' + s6);
    
            System.debug('**********center(size)**********');
    
            // center(size)
            String s7 = 'hello';
            String s8 = s7.center(9);
            System.assertEquals('  hello  ', s8);
            System.debug('The String Is: ' + s7);
            System.debug('After using metod: ' + s8);
    
            System.debug('***********center(size,paddingString)**********');
    
            // center(size,paddingString)
            String s9 = 'hello';
            String s10 = s9.center(9, '-');
            System.assertEquals('--hello--', s10);
            System.debug('The String Is: ' + s9);
            System.debug('After using method: ' + s10);
    
            System.debug('********charAt(index)*********');
    
            // charAt(index)
            String str1 = 'Ω is Omega.';
            System.assertEquals(937, str1.charAt(0));
            System.debug('The String Is: ' + str1);
            System.debug('After using method: ' + str1.charAt(0));
    
            System.debug('*********compareTo(secondString)*********');
    
            // compareTo(secondString)
            String myString1 = 'abcde';
            String myString2 = 'abcd';
            Integer result1 = myString1.compareTo(myString2);
            System.assertEquals(result1, 1);
            System.debug('After compare both Strings: ' + result1);
    
            System.debug('**********contains(subString)********');
    
            // contains(subString)
            String myString3 = 'abcde';
            String myString4 = 'abcd';
            Boolean result2 = myString3.contains(myString4);
            System.assertEquals(result2, true);
            System.debug('First String Is: ' + myString3);
            System.debug('Second String Is: ' + myString4);
            System.debug('After checking second string exist or not: ' + result2);
    
            System.debug('*********containsIgnoreCase(subString)*********');
    
            // containsIgnoreCase(subString)
            String s11 = 'hello';
            Boolean b1 = s11.containsIgnoreCase('HE');
            System.assertEquals(true, b1); 
            System.debug('String Is: ' + s11);
            System.debug('After Using Method: ' + s11.containsIgnoreCase('HE'));
    
            System.debug('*********containsNone(inputstring)**********');
    
            // containsNone(inputSting)
            String s12 = 'abcde';
            System.assert(s12.containsNone('fg'));
            System.debug('The String Is: ' + s12);
            System.debug('After using method: ' + s12.containsNone('fg'));
    
            System.debug('*********containsOnly(inputString)********');
    
            // containsOnly(inputString)
            String s13 = 'abba';
            String s14 = 'abba xyz';
            Boolean b2 = s13.containsOnly('abcd');
            System.assertEquals(true, b2);
            System.debug('First String Is: ' + s13);
            System.debug('Second String Is: ' + s14);
            System.debug('After using containsOnly method: ' + b2);
    
            System.debug('*********equals(secondString)*********');
    
            // equals(secondString)
            String myString5 = 'abcde';
            String myString6 = 'abcd';
            Boolean result3 = myString5.equals(myString6);
            System.assertEquals(result3, false);
            System.debug('First String Is: ' + myString5);
            System.debug('Second String Is: ' + myString6);
            System.debug('After discussing Equals or Not: ' + result3);
    
            System.debug('**********equals(stringOrId)***********');
    
            // equals(stringOrId)
            // Compare a string to an object containing a string
            Object obj1 = 'abc';
            String str2 = 'abc';
            Boolean result4 = str2.equals(obj1);
            System.assertEquals(true, result4);
            System.debug('Checking object and string are equals or not: ' + result4);
    
            // Compare a string to an object containing a number
            Integer obj2 = 100;
            Boolean result5 = str2.equals(obj2);
            System.assertEquals(false, result5);
            System.debug('Compare String to an Object: ' + result5);
    
            // Compare a string to an ID of the same length.
            // 15-character ID
            Id idValue15 = '001D000000Ju1zH';
            // 15-character ID string value
            String stringValue15 = '001D000000Ju1zH';
            Boolean result6 = stringValue15.equals(IdValue15);
            System.assertEquals(true, result6); 
            System.debug('Compare String to an Id: ' + result6);
    
            // Compare two equal ID values of different lengths:
            //  15-character ID and 18-character ID
            Id idValue18 = '001D000000Ju1zHIAR';
            Boolean result7 = stringValue15.equals(IdValue18);
            System.assertEquals(true, result7);
            System.debug('Compare two equal ID values of different lengths: ' + result7);
    
            System.debug('**********escapeJava()*********');
    
            // escapeJave()
            // Input string contains quotation marks
            String s15 = 'Company: "Salesforce.com"';
            String escapedStr = s15.escapeJava();
            // Output string has the quotes escpaded
            System.assertEquals('Company: \\"Salesforce.com\\"', escapedStr);
            System.debug('After using method: ' + escapedstr);  


            System.debug('**********contains(subString)*********');
            
            //contains(subString)
            String myString7 = 'abcde';
            String myString8 = 'abcd';
            Boolean result8 = myString7.contains(myString8);
            System.assertEquals(result7, true);
            System.debug('First String Is: ' + myString7);
            System.debug('Second String Is: ' + myString8);
            System.debug('After checking second string exist or Not: ' + result8);


            System.debug('**********containsIgnoreCase(substring)*********');

            String s16 = 'hello';
            Boolean b3 = s16.containsIgnoreCase('HE');
            System.assertEquals(true, b3);
            System.debug('String Is: ' + s16);
            System.debug('After using Method: ' + s16.containsIgnoreCase('HE'));

        }
}