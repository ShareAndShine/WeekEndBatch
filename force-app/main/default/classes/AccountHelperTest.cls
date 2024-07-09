@isTest
private with sharing class AccountHelperTest {
    
    @isTest
    private static void CreateOpportunties_after_AccountInsert_Positive_Test()
    {
        // Positive Case
        // Step 1: Create a new account with industry Agriculture
        // Step 2: Check if only one opporunity created
        // if yes - Mark Test case as succcess else, failed

        Account acc = new Account(Name='Test Ltd', Industry='Agriculture');
        Integer actualNoOfOpportunites;

        // run the test
        Test.startTest();
            insert acc; // this line would call the trigger. Trigger in turn, inserts opportunity
        Test.stopTest();

        System.debug('Test Ltd | Account ID::' + acc.Id);

        // query and see how many opportunities created after AccountInsert()
        List<Opportunity> oppRecs = [SELECT Id, Name FROM Opportunity WHERE AccountId = :acc.Id];
        System.debug('Opportunities created after AccountInsert()::' + oppRecs.size());

        if(oppRecs != null)
        {
                actualNoOfOpportunites = oppRecs.size(); // assign total opp. records to a variable
        }
    
        // check the results
        System.assertEquals(1, actualNoOfOpportunites, 'Expected one opporunity to be created');
    }
        
        
        
    
    @isTest
    private static void CreateOpportunties_after_AccountInsert_negative_Test()
    {
        // Negative Case
        // Step 1: Create a new account with industry anything other than Agriculture
        // Step 2: Check if any opporunity is created
        // if yes - Mark Test case as failed else, success
        
        Account acc = new Account(Name='Test Ltd', Industry='Banking');
        Integer actualNoOfOpportunites;

        // run the test
        Test.startTest();
            insert acc; // this line would call the trigger. Trigger in turn, inserts opportunity
        Test.stopTest();

        System.debug('Test Ltd | Account ID::' + acc.Id);

        // query and see how many opportunities created after AccountInsert()
        List<Opportunity> oppRecs = [SELECT Id, Name FROM Opportunity WHERE AccountId = :acc.Id];
        System.debug('Opportunities created after AccountInsert()::' + oppRecs.size());

        if(oppRecs != null)
        {
                actualNoOfOpportunites = oppRecs.size(); // assign total opp. records to a variable
        }
    
        // check the results
        System.assertEquals(0, actualNoOfOpportunites, 'Expected one opporunity to be created');
        
        
    }

}