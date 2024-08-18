// USe CAse: Every day at 9 in the evening, the system should create a task to opportunity owners to remind creating contract for the opportunity that was closed won

public with sharing class AutoTaskCreation implements Schedulable{
    public AutoTaskCreation() {

    }

    public void execute(System.SchedulableContext sc)
    {
        // write any code
        List<Opportunity> lstOpps =  [SELECT Id, Name, OwnerId FROM Opportunity WHERE StageName = 'Closed Won'];

        
        List<Task> lstTasks = new List<Task>();

        for(Opportunity oppRec: lstOpps){
            Task tskRec = new Task();
            tskRec.OwnerId = oppRec.OwnerId;
            tskRec.Subject = 'Create Contract for Opportunity: ' + oppRec.Name;
            tskRec.WhatId = oppRec.Id;
            tskRec.ActivityDate = System.today() + 5;
            tskRec.Description = 'Please create a contract for the opportunity: ' + oppRec.Name;
            
            lstTasks.add(tskRec);
            
        }

        insert lstTasks;
    }
}