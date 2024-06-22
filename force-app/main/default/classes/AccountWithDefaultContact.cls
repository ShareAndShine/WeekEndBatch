public with sharing class AccountWithDefaultContact {
    public AccountWithDefaultContact() {

    }

    public static void CreateDefaultContact(List<Account> lstaccs) 
    {

        // write the logic

        List<Contact> lstContactToInsert = new List<Contact>();

        
        // Step 1: Access new account(s) being created using context variable Trigger.new
        for(Account accRec : lstaccs)
        {
            // Step 2: Create a new contact record
            System.debug('Account Id::' + accRec.Id);

            Contact conRec = new Contact(); 
            conRec.FirstName =  accRec.Name + '-' + accRec.Id + '- FN';
            conRec.LastName =  accRec.Name + '-' + accRec.Id + '- LN';
            conRec.AccountId = accRec.Id;

            lstContactToInsert.add(conRec);            
        }

        // Bulkified
        insert lstContactToInsert;

    }

    public static void CreateASingleDefaultContact(Account accRec) 
    {

        // write the logic

        
    System.debug('Account Id::' + accRec.Id);

    Contact conRec = new Contact(); 
    conRec.FirstName =  accRec.Name + '-' + accRec.Id + '- FN';
    conRec.LastName =  accRec.Name + '-' + accRec.Id + '- LN';
    conRec.AccountId = accRec.Id;


    // Bulkified
    insert conRec;

    }


}