trigger UserTrigger on User (before delete, before insert, before update, after update, after insert, after delete) 
{

    if(trigger.isAfter && trigger.isInsert)
    {
        // get user(s) being inserted 
        List<User> lstUsers = Trigger.new;

        
        // Loop thru the users and assign permission set
        for(User userRec :lstUsers)
        {

            // get the userId
            Id userId = userRec.Id;
            UserController.assignPermissionSetToUser(userId);

        }


        // Write the logic
        
        System.debug('Completed the task');
    }
}