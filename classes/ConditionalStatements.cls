public with sharing class ConditionalStatements {
    public static void conditionalStatementsInApex() {
        Integer x=2 , sign;
        // Your code
        if (x <= 0) {
            if (x == 0) {
                   sign = 0; 
                   System.debug(sign);
            } else  {
                   sign = -1;
                   System.debug(sign);
            }
        }

            Integer place = 1;
            String medal_color;
            if (place == 1) {
                medal_color = 'gold';
                System.debug(medal_color);
        }   else if (place == 2) {
            medal_color = 'silver';
            System.debug(medal_color);
        } else if (place == 3) {
            medal_color = 'bronze';
            System.debug(medal_color);
        }  else {
            medal_color = null;
        }
    }




    public static void doWhileLoops(){
           Integer count = 1;

           do {
            System.debug(count);
            count++;
        }   while (count < 11);
    }


    public static void whileLoop(){

        //While Loop
          Integer count = 1;

          while (count < 11) {
            System.debug(count);
            count++; 
        }
    }


    public static void forLoop(){
   
        for(integer i=1; i<=10;i++){
            System.debug(1);
        }


        System.debug('**********Print Table***********');
        for(Integer i=2; i<=20; i=i+2) {
            System.debug(i);
        }
    }



}