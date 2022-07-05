public with sharing class ProcessStudentData {
    public processStudentData(){
		
		//Getter method
		Student__c st = StudentDataProvider.stData;
	}
	
	public void saveStudentData(){
        Student__c s1;
		Student__c studentData = s1;
		//Setter Method
		StudentDataProvider.stData = s1;
		
	}
}