trigger UserTrigger on User (before delete, before insert, before update, after update, after insert, after delete) 
{

    if(trigger.isAfter && trigger.isInsert)
    {
        // get user(s) being inserted 
        List<User> lstUsers = Trigger.new;
        Set<Id> lstUserIds = new Set<Id>();
        
        // Loop thru the users and assign permission set
        for(User userRec :lstUsers)
        {

            // get the userId
            Id userId = userRec.Id;
           
            // collect all the user Ids
            // instead of calling method in the loop
            // call once
            //UserController.assignPermissionSetToUser(userId);
            lstUserIds.add(userId);

            // UseCase #2 - Start

            // Check if the user profiel name contains 'Sales' then call the method
            UserController.assignSalesUserToPublicGroup(userId);

            UserController.assignSalesUserToChatterGroup(userId);


            // UseCase #2 - End


        }

        // call the method once outside of loop
        UserController.assignPermissionSetToUser(lstUserIds);

        // Write the logic
        
        System.debug('Completed the task');
    }
}