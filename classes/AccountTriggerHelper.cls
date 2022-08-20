/**
    *  Description     :  This is Account trigger helper class.(The content of this class only work on Account Object).
    *
    *  Created By      :  Harendra Kumar
    *
    *  Created Date    :  20/07/2022
    *
    *  Revision Logs   :  V1.0 - Created by - Harendra Kumar
    *
**/
public with sharing class AccountTriggerHelper {
/* 
*    @Description    :      The content of this method is used for send email notification with a random account number on existing email id.
*
*    @args           :       
*
*    @return         :       void (Nothing)
*
*    @revision Log   :       V1.1  - Created  -  20/07/2022  - Harendra Kumar
*                                    
*/
    public static void sendEmailNotification(List<Account> accList) {
        List<Messaging.Email> emailList = new List<Messaging.Email>();
    
        for(Account acc : accList) {
            If(acc.Email__c != null) {
                Messaging.SingleEmailMessage emailMsg =  new Messaging.SingleEmailMessage();
                String[] toAddress = new String[] {
                    acc.Email__c
                };
                emailMsg.setToAddresses(toAddress);
                String subject = 'Congratulations ' + acc.Name;
                emailMsg.setSubject(subject);
                String senderName = 'Harendra Kumar';
                emailMsg.setSenderDisplayName(senderName);
                String body = 'HELLO ' + acc.Name + ',<br/><br/>' + 'Your Account has been created Successfully <br> Have a great day ahead <br> AccountNumber: ' +acc.AccountNumber;
                emailMsg.setHtmlBody(body);
                emailList.add(emailMsg);
            }
        }
        if(emailList.size() > 0){
            Messaging.sendEmail(emailList);
        } 
    }

/* 
*    @Description    :      The content of this method is used for insert and update records.
*
*    @args           :       
*
*    @return         :       void (Nothing)
*
*    @revision Log   :       V1.1  - Created  -  21/07/2022  - Harendra Kumar
*
*/
    public static void populateAccountType(List<Account> newAccounts, Map<Id,Account> oldAccountMap){

        //Loop Over New Account Records 
        for(Account acc : newAccounts){   
                    //Insert                  //Update 				  Saving Account		FD Account
            if(oldAccountMap == null || oldAccountMap != null && (acc.Type != oldAccountMap.get(acc.Id).Type)){
                    
            if(acc.Type == 'Saving Account' && acc.AccountNumber != null){
                acc.AccountNumber = 'SA-' + acc.AccountNumber; 
            }     
                //Insert Case
            // if(oldAccountMap == null){
            //     acc.AccountNumber = 'SA-' + acc.AccountNumber;    
            // }else{
            //     //Update Case
            //     acc.AccountNumber = acc.AccountNumber.replace('FD', 'SA');
            // }
                            
            if(acc.Type == 'FD Account' && acc.AccountNumber != null){
                        
                    //Insert Case
                if(oldAccountMap == null){
                    acc.AccountNumber = 'FD-' + acc.AccountNumber;        
                }else{
                    //Update Case
                    acc.AccountNumber = acc.AccountNumber.replace('SA', 'FD');
                }
            }
        }
    }
}                
/* 
*    @Description    :      The content of this method is used for create Trigger Events.
*
*    @args           :       
*
*    @return         :       void (Nothing)
*
*    @revision Log   :       V1.1  - Created  -  24/07/2022  - Harendra Kumar
*
*/    
    public static void eventsOfTrigger(List<Account> newList, List<Account> oldList) {
        If(Trigger.isBefore) {
            System.debug('************Check Before Trigger Operation************');
            If(Trigger.isInsert) {
                System.debug('Check Insert List:: Trigger.New ' + Trigger.New);
                System.debug('Check Insert List:: Trigger.Old ' + Trigger.Old);
            }
            If(Trigger.isUpdate) {
                System.debug('Check Update List:: Trigger.New ' + Trigger.New);
                System.debug('Check Update List:: Trigger.Old ' + Trigger.Old);
            }
            If(Trigger.isDelete) {
                System.debug('Check Delete List:: Trigger.New ' + Trigger.New);
                System.debug('Check Delete List:: Trigger.Old ' + Trigger.Old);
            }
        }


            If(Trigger.isAfter) {
            System.debug('***********Check After Trigger Operation**********');
            If(Trigger.isInsert) {
                System.debug('Check Insert List:: Trigger.New ' + Trigger.New);
                System.debug('Check Insert List:: Trigger.Old ' + Trigger.Old);
            }
            If(Trigger.isUpdate) {
                System.debug('Check Update List:: Trigger.New ' + Trigger.New);
                System.debug('Check Update List:: Trigger.Old ' + Trigger.Old);
            }
            If(Trigger.isDelete) {
                System.debug('Check Delete List:: Trigger.New ' + Trigger.New);
                System.debug('Check Delete List:: Trigger.Old ' + Trigger.Old);
            }
            If(Trigger.isUnDelete) {
                System.debug('Check UnDelete List:: Trigger.New ' + Trigger.New);
                System.debug('Check UnDelete List:: Trigger.Old ' + Trigger.Old);
            }
        }
    }

    public static void populatePropertyStatusOnAccount(List<Account> accList){

        Set<Id> setOfPropertyIds = new Set<Id>();
        for (Account acc : accList) {
            setOfPropertyIds.add(acc.Property__c);
        }

        List<Property__c> properties = [Select Id, Name, Status__c From Property__c Where Id In : setOfPropertyIds];
        Map<Id, Property__c> mapOfProperties = new Map<Id, Property__c>();
        mapOfProperties.putAll(properties);

        for (Account acc : accList) {
            if (acc.Status__c == null) {
                Property__c prop = mapOfProperties.get(acc.Property__c);
                if (prop.Status__c != null) {
                    acc.Status__c = prop.Status__c;
                }
            }
        }
    }
}