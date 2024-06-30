@isTest
private with sharing class AccountWithDefaultContactTest {
    
    @isTest
    static void CreateDefaultContactTest()
    {


        // Actual code to test
        // to call this method, we need an account data

        // prepare sample account
        Account acc = new Account();
        acc.Name = 'Test Account One';
        
        Test.startTest();
        
            // creates a new account 
            // and a contact is created via account trigger | Total contacts count is 1 
            insert acc; 
            Id newaccId = acc.Id; // reading new account record id and storing in a variable
            
            // call the method to create a default contact | Total contacts count is 2
            AccountWithDefaultContact.CreateASingleDefaultContact(acc);
            
        Test.stopTest();

        // query and see how many contacts created after CreateASingleDefaultContact()
        // is called.
        // Excepted # of contacts created is 1
        // Actual # of contacts created should be also 1

        List<Contact> lsContacts = [SELECT Id FROM Contact WHERE AccountId = :newaccId];

        // store # of contacts retrieved from the above query
        Integer NoOfContactsCreated = lsContacts.size();


        // Expected Output #1: There should be only one contact created
        System.assertEquals(2, NoOfContactsCreated, 'More than one contact was created. Hence, failing the test. Pls correct the code');
    }  
    
    @istest

    static void LearningSystemAssertEquals()
    {
        System.assertEquals('ABCD','XYZ', 'Excepted and Actual are not matching. Hence, failing the test. Pls correct the code');
        
    }


    @istest
    static void accountTrigger_afterInsertTest()
    {
        // Create one or more acccounts
        Account acc =  new Account(Name='Frozen Food Ltd');

        // Perform test (Test.startTest() || test.stopTest())
        Test.startTest();
             insert acc; // this will call account trigger, which inturn calls CreateDefaultContact() method
        Test.stopTest();

        // Get the account(s) that we inserted inside perform test block
        Account insertedTestAccount = [SELECT Id, Name FROM Account WHERE NAME = 'Frozen Food Ltd'];
        
        // Fetch the contact for the above inserted account and use assert method to check on count of contact(s)
        List<Contact> insertedContacts = [SELECT Id, Name, Account.Name FROM Contact WHERE Account.Name = 'Frozen Food Ltd'];

        // verify total contacts associated 
        Integer iTotalContactsCreated = insertedContacts.size();

        // Verify whether the count of contacts is correct or not
        System.assertEquals(1, iTotalContactsCreated, 'Only one contact should present');
    }


    @istest
    static void accountTrigger_deleteTest_WithOpenOpportunity()
    {
        // Create an acccount with an opportunity in open stage
        // perform test - try deleting the account created above
        // verify results
            // 1. System should throw an error msg 
        
    }
    
    
    @istest
    static void accountTrigger_deleteTest_WithNoOpenOpportunity()
    {
        // Create an acccount with an opportunity in closed stage
        // perform test - try deleting the account created above
        // verify results
            // 1. to confirm if the account is removed, 
                // Fetch the account and u should see no account record in the output 


      // Create one or more acccounts
      Account acc =  new Account(Name='Frozen Food Ltd');

      // Perform test (Test.startTest() || test.stopTest())
      Test.startTest();
           insert acc; // this will call account trigger, which inturn calls CreateDefaultContact() method

           // get the account id and insert a new opportunity with closed stage status
           Opportunity oppRec = new Opportunity(Name='Test Opportunity', AccountId=acc.Id, StageName='Closed Won', CloseDate=Date.newInstance(2024, 8, 30));
           insert oppRec;

           // try deleting the account created
           delete acc;

           Test.stopTest();
        
        // verify the results
        List<Account> accDeletedRecord = [SELECT Id, Name FROM Account WHERE Name='Frozen Food Ltd'];

         // verify that no account record is present
        System.assertEquals(0, accDeletedRecord.size(), 'No account should be present as the opportunity is existing');

    }
}
    





