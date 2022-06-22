public with sharing class PrintpatternProgram {
     //1. Creating Downward Star Pattern Program
     public static void downWardStarPattern() {
        for(Integer i=1; i<=5; i++) {
            String s=' ';
            for(Integer j=5; j>=i; j--) {
                s = s + '*'; 
            }
            System.debug(s);
        }
    }

    //2. Creating Left Triangle Star Programs
    public static void leftTriangleStarPattern() {
        for(Integer i=1;i<=5;i++) {
            String s='  ';
            for(Integer j=1;j<=5;j++)
            {
                if(j>=6-i )
                {
                    s = s + '*';
                }
                else
                {
                     s = s + '_';
                }
            }
            
            System.debug(s);
        }
    }

     //3. Print Numeric Pattern In Descending Order
     public static void numericPattern() {
        for(Integer i=5; i>0; i--) {
            String s='  ';
  
            for(Integer j=5; j>=i; j--) {
                s=s+j;
            }
            System.debug(s);
        }
    }

    //4. Print Left Triangle Pascals Program

    public static void leftTrianglePascalsProgram() {
        integer k=6;
        for(integer i=1;i<=9;i++) {

            if(i<=5){k--;} else{k++;}
            string s='  ';
            for(integer j=1;j<=5;j++) {

                if(j>=k) {
                    s = s + 'x';
                }
                else {
                    s = s + '_';
                }
        }
        
        System.debug(s);    
    }
    }

    // 5. Print Down Triangle Pattern Program

    public static void downTrianglePattern() {
        boolean b=true;
        for(integer i=1;i<=5;i++) {
        string s='  ';
        for(integer j=1;j<=9;j++)
        {
          if(i>=2 && i<=4){if(j>=1+i && j<=9-i){b=false;}else{b=true;}}else{b=true;}
            
            if(j>=i && j<=10-i && b)
            {
                s = s + 'x';
              
            }
            else
            {
                 s = s + '_';
               
            }
        }
        
        system.debug(s);
        
        }
    }
}