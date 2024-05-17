public with sharing class DataManupulationUsingCollections {
    public DataManupulationUsingCollections() {

    }
    //{Id=0015j00001aVH7JAAW, Name=San Clothing, Industry=Agriculture, CurrencyIsoCode=INR}
    //{Name=Adline Agro Ltd, Industry=Agriculture}

    public static void SetUpNewAccount()
    {
        // every object in salesforce is essentially a class
        // every field in the object is esseientially a property of the class
        Account acc = new Account();
        acc.Name = 'Adline Agro Ltd';
        acc.Industry = 'Agriculture';

        
        System.debug('acc to be inserted  ' + acc);
        System.debug('Before Insert account record Id is  ' + acc.Id);

        // insert the record into salesforce
        insert acc;
        System.debug('After Insert account record Id is  ' + acc.Id);        

    }   


    public static Id CreateNewAccount(string strAccName, string strIndustry)
    {
        // every object in salesforce is essentially a class
        // every field in the object is esseientially a property of the class
        Account acc = new Account();
        acc.Name = strAccName;
        acc.Industry = strIndustry;

        
        System.debug('acc to be inserted  ' + acc);
        System.debug('Before Insert account record Id is  ' + acc.Id);

        // insert the record into salesforce
        insert acc;
        System.debug('After Insert account record Id is  ' + acc.Id);    
        
        return acc.Id;

    }   



    
    public static void createAccountWithContract(String straccountName, String strbillingStreet, 
    String strbillingCity, String strbillingState, String strbillingPostalCode, String strbillingCountry) {
        
        // Create a new Account record
        Account newAcc = new Account(
            Name = straccountName,
            BillingStreet = strbillingStreet,
            BillingCity = strbillingCity,
            BillingState = strbillingState,
            BillingPostalCode = strbillingPostalCode,
            BillingCountry = strbillingCountry
        );
        // Insert the new Account
        System.debug('Before insert:: ' + newAcc.Id);
        insert newAcc; // DML #1
        System.debug('After  insert:: ' + newAcc.Id);

        // Check if account is created then proceed with contract creation
        if (newAcc.Id!= null) 
        {

            // Create a new Contract record associated with the newly created Account
            Contract newContract = new Contract();
            newContract.AccountId = newAcc.Id; 
            newContract.ContractTerm = 1;
            newContract.StartDate = Date.today();
            newContract.Status = 'Draft';
            newContract.Name = ('Onboarding Contract - ' + newAcc.Name);

        

            // Insert the new Contract record
            insert newContract;    // DmL #2

        }

        
}

    public static void SampleTryCatch()
    {

        Lead objLeadRec = new Lead();
        objLeadRec.FirstName = 'Test';
        objLeadRec.LastName = 'Lead';
        
        Lead objLeadRecTopdate = [SELECT Id, FirstName, LastName FROM Lead LIMIT 1];
        System.debug('Before change objLeadRecTopdate::' + objLeadRecTopdate);
        String strNewLastName = objLeadRecTopdate.LastName + '- Updated';
        objLeadRecTopdate.LastName = strNewLastName;
        System.debug('After change objLeadRecTopdate ::' + objLeadRecTopdate);


        // if any line of code inside try block errors out , immediately the catch block gets the control
        try {
            
            /*for(integer i=0 ; i<200; i++)
            {
                Account accRec = new Account(name='test acc');
                insert accRec;
            }*/
           
            insert objLeadRec; // Error
            update objLeadRecTopdate;


        }
        catch(DmlException objDMLEx)
        {
            String strErrorMessage = objDMLEx.getMessage() + ' - Caught by DML Catch Block';
            System.debug('Exception Message::' + strErrorMessage);
        } 
        catch(LimitException objLmtEx)
        {
            String strErrorMessage = objLmtEx.getMessage() + ' - Caught by Limit Exception Block';
            System.debug('Exception Message::' + strErrorMessage);
        }
        catch (Exception objEx) // exception is a system class
        {
            //throw new Exception(objEx.getMessage()); // getMessage is a method in exception class which gives you the actual error message
            System.debug('Exception Message::' + objEx.getMessage());

            // Write code to send an email to admin or developer with the error message
            // Write code to log the error in a chatter group for developers to check and resolve
            // Write code to create a task to developer to resolve the error
        }
        

    }

    
}