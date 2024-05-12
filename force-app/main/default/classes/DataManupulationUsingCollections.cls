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

    
}