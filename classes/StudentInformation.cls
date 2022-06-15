public class StudentInformation {
    public static void InsertStudent() {
        Student__c student = new Student__c();
        //Personal Detail
        student.Roll_Number__c = '18455';
        student.Name = 'Govind Kumar';
        student.Father_s_Name__c = 'Suresh chandra';
        student.Father_Mobile_Number__c = '9587634783';
        student.Mobile_Number__c = '9758675436';
        student.Date_Of_Birth__c = date.parse('7/6/2002');
        student.Email__c = 'govind.kumar@gmail.com';
        student.Home_Phone__c = '9234565444';
        student.Overall_Grade__c = 'B';
        student.Address__c = 'Rajiv Technology';
        student.City__c = 'Mathura';
        student.Pincode__c = 281203;
        student.State__c = 'Uttar Pradesh';
        student.RecordTypeId = '0125i0000000qmAAAQ'; //Record Type Id = Teacher
        //Class Details   
        student.Section__c = 'C';
        student.Class__c = 'B.Sc';
        student.Stream__c = 'Science';
        //Semester Information
        student.X1st_Sem_Back__c = False;
        student.X1st_Sem_Percentage__c = 56;
        student.X2nd_Sem_Back__c = False;
        student.X2nd_Sem_Percentage__c = 60;
        student.X3rd_Sem_Back__c = False;
        student.X3rd_Sem_Percentage__c = 72;
        student.X4th_Sem_Back__c = True;
        student.X4th_Sem_Percentage__c = 69;
        student.Subjects_in_which_Back_1st_Sem__c = '';
        student.Subjects_in_which_Back_2nd_Sem__c = '';
        student.Subjects_in_which_Back_3rd_Sem__c = '';
        student.Subjects_in_which_Back_4th_Sem__c = 'C++,Data Structure';
        //Fees Details
        student.Current_Year__c = '3rd Year';
        student.Is_Donation__c = False;
        student.Donation_Amount__c = 0;
        student.Fees_Submitted__c = True;
        student.Pending_Fees_Amount__c = 50;
        student.Exam_Fees_Submitted__c = True;
        student.Pending_Exam_Fees__c = 0;
        //Bank Details
        student.Bank_Name__c = 'Central Bank of India';
        student.IFSC_Code__c = 'CBIN0284021';
        student.Account_Number__c = 1463135153;
        student.Bank_Phone_Number__c = '9954199236';
        
        insert student;
    }
    
    public static void displayStudents() {
        List<Student__c> studentsList = [SELECT Student_ID__c, Roll_Number__c, Name, Father_s_Name__c, Class__c, Email__c, Mobile_Number__c, Address__c FROM Student__c ORDER BY CreatedDate];
        for(Student__c student : studentsList) {
            system.debug('Check Student Data : ' + student);
        }
    }
}