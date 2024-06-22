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
        
            insert acc; // creates a new account 
            Id newaccId = acc.Id; // reading new account record id and storing in a variable
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
        System.assertEquals(1, NoOfContactsCreated, 'More than one contact was created. Hence, failing the test. Pls correct the code');
    }   
}