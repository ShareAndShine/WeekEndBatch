
// Use Case: Business team is looking to backup all customer orders everyday and move to a 3rd party database (MS Azure SQL)
public with sharing class BackupOrdersData implements Database.Batchable<SObject>{
   
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        
        // Step 1: Query the data to be processed 
        String szQuery = 'SELECT Id, Name, Account__r.Name FROM Order';
        
        return Database.getQueryLocator(szQuery); // runs the query and returns all the records in a list to the other methods to process 
        
    }

    public void execute(Database.BatchableContext bc, List<Order> OrderRecs)
    {
        // Step 2: Update the records retrieved in the start method

        // Write logic to connect to AZ URE SQL DB

        HttpRequest req = new HttpRequest();
         req.setEndpoint('https://routes.googleapis.com/directions/v2:computeRoutes?key=YOUR_API_KEY');
                req.setMethod('POST');
                req.setHeader('Authorization', 'Bearer ' + '{!.Password}');
            
        
        // Send Data

    }


    public void finish(Database.BatchableContext bc)
    {
        // send mail conforming data move

    }

}