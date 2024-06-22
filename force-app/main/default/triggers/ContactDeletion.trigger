trigger ContactDeletion on Contact (before delete, before update, before insert, after delete, after update, after insert) {
    
    
    if(trigger.isbefore && trigger.isUpdate){


    }

    if(trigger.isBefore && trigger.isInsert){
    
        //Code that checks if email is a business email 
        ContactHandler.SendEmailToContacts(Trigger.new);

        //code that checks if email is reachable
        ContactHandler.ActiveEmailCheck(Trigger.new);

         
    }


    if(trigger.isAfter && trigger.isUpdate){

        //Code that sends email to contacts
        //Code that creates tasks
    }
    if(trigger.isBefore && trigger.isDelete){

        // Code that checks if contact has open cases
        ContactHandler.ContactDeleteValidation(Trigger.old);             
        
        // Code that checks if contact has open service contracts
        ContactHandler.ContactDeleteValidationOnContracts(Trigger.old);             
        
        
    
    }
}