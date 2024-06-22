trigger AccountTrigger on Account (before delete, before insert, before update, after update, after insert, after delete) 
{

    // events - Determines when the trigger code should run
    System.debug('Inside Account Trigger');

    // Use Case: System should stop the user from deleting an Account when there is an open opportunity
    
    
    // how do I access or intercept the data from the trigger?
    
    // Context variables
    // Trigger.new - new record. Holds collection of records always
    // Trigger.old - old record. Holds collection of records always
    // Trigger.oldMap - old record in Map format
    // Trigger.newMap - new record in Map format


    // Trigger.isInsert - true if insert
    // Trigger.isUpdate - true if update
    // Trigger.isDelete - true if delete

    // Trigger.isBefore - true if before
    // Trigger.isAfter - true if after
    // Trigger.isDelete - true if delete

    System.debug('isInsert ::'+ Trigger.isInsert);
    System.debug('isUpdate ::'+ Trigger.isUpdate);
    System.debug('isDelete ::'+ Trigger.isDelete);

    System.debug('isBefore ::'+ Trigger.isBefore);
    System.debug('isAfter ::'+ Trigger.isAfter);
    
    
    if(Trigger.isDelete && Trigger.isBefore)
    {
        // check if there is an open opportunity

        System.debug('Intercepted data | Trigger.old :: ' + Trigger.old);
        System.debug('Intercepted data Trigger.new :: ' + Trigger.new);

        List<Account> lstaccs = Trigger.old; // using trigger.old we are accessing account(s) that are being deleted

        // loop thru each account record in the Trigger old 
        // and find if there is an open opportunity , if yes, stop user from deleteint the record by throwing an error

        /* BAD CODE : No Bulkification cos there is a select query inside for loop and it may work upto 100 records before it throw SOQL queries limits exception 
        for(Account accRec : lstaccs)
        {
            System.debug('Account Id::' + accRec.Id);

            // SOQL query to check if there is a open Opportunity
            List<Opportunity> lstOpps = [Select Id from Opportunity where AccountId = :accRec.Id and StageName != 'Closed Won' and StageName != 'Closed Lost'];

            System.debug('Total Opps in open stage::' + lstOpps.size());


            if(lstOpps.size() > 0)
            {

                // if there is a open opp , throw an error to show in UI
                accRec.addError('Please close the open opportunities before deleting the record');
            }
           
        }
        /*/

        // Bulkify the code 
        // Step 1: Collect all account Ids in a list
        Set<Id> accIds = new Set<Id>();
        for(Account accRec : lstaccs)
        {
            accIds.add(accRec.Id);
        }

        System.debug('All accounts being deleted::' + accIds);

        // Step 2: Run a single SOQL to find all the opportunites of all the account records
        List<Opportunity> lstOpps = [Select Id, AccountId, Name from Opportunity where AccountId IN :accIds and StageName != 'Closed Won' and StageName != 'Closed Lost'];

        //  Step 3: Loop thru the list of opportunities and find if there is a open opportunity for each account and store the info
        Set<Id> accsIdsWithOpenOpps = new Set<Id>();
        for(Opportunity oppRec : lstOpps)
        {
            System.debug('Account ID having open opportunity::' + oppRec.AccountId);
            accsIdsWithOpenOpps.add(oppRec.AccountId);
        }

        // Step 3.1: Create a map to hold account id as a key and account record as value
        Map<Id, Account> mapAccounts = new Map<Id, Account>();
        for(Account accRec :lstaccs)
        {

            mapAccounts.put(accRec.Id, accRec); // this amp will have all the 3 accounts
        }

        // Step 4: Loop thru account with open
        // opportunites and throw error back to UI
        for(Id accId :accsIdsWithOpenOpps) // accsIdsWithOpenOpps will have account Ids that have open opportunites  
        {
            
            Account accRecordWithOpenOpp = mapAccounts.get(accId); // this will give you the account record...more like vlookup
            System.debug('accRecordWithOpenOpp::' + accRecordWithOpenOpp);
            accRecordWithOpenOpp.addError('Please close the open opportunities before deleting the record');
        }


    }

    // Use Case #2: When an new account is created, based on the annual revenue update category field as either tier 1, tier 2 or tier 3
    if(Trigger.isInsert && Trigger.isBefore)
    {
        // write the logic
    }

    if(Trigger.isInsert && Trigger.isAfter)
    {
        
        // Step 1: Access new account(s) being created using context variable Trigger.new
        // Call the method and pass on the list of accounts
        AccountWithDefaultContact.CreateDefaultContact(Trigger.new);

    }

    // Use case #3: Update Account record with auto generated account number whenever a new account is created  
    if(Trigger.isBefore && Trigger.isInsert)
    {

        // Intercept the record being inserted
        List<Account> lstaccsBeingInserted = Trigger.new;
        
        for(Account accRec: lstaccsBeingInserted)
        {
            // Call generateRandomAutoNumber method 
            String szRandomAccountNumber = AutoNumberGenerator.generateRandomAutoNumber();
            
            System.debug('Random Account Number::' + szRandomAccountNumber);

            accRec.AccountNumber = szRandomAccountNumber; // Assign value to account number field

        }
    }

}