public with sharing class BackOrdersDataScheduler implements Schedulable 
{
    public void execute(System.SchedulableContext sc)
    {

        // write any code here

        // Call batch apex code 
        BackupOrdersData onjBackupOrdersData = new BackupOrdersData();
        Database.executeBatch(onjBackupOrdersData);


       
        
    }
}