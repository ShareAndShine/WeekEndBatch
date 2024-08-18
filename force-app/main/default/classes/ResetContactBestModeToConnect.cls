// Use Case: Business team is looking to reset all 500,000 contact records' best time to contact as 'Not provided'. So that
// they can run a campaign and get consenus from contact and get the data update per latest preference

public with sharing class ResetContactBestModeToConnect implements Database.Batchable<SObject>{
    public ResetContactBestModeToConnect() {

    }

    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        // Step 1: Query the data to be processed 
        String szQuery = 'SELECT Id, Name, Best_Mode_To_Connect__c FROM Contact';
        
        return Database.getQueryLocator(szQuery); // runs the query and returns all the records in a list to the other methods to process 
        
    }

    public void execute(Database.BatchableContext bc, List<Contact> contactsScope)
    {
        // Step 2: Update the records retrieved in the start method

        for(Contact contactRec: contactsScope)
        {
            contactRec.Best_Mode_To_Connect__c = 'Email';
        }

        update contactsScope;
    }


    public void finish(Database.BatchableContext bc)
    {
        // send mail

    }

}