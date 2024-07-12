public with sharing class UserController {



@future    
public static void assignPermissionSetToUser(Id userId)
{

    // get the permission set
    PermissionSet objPS = [SELECT Id, Name FROM PErmissionSet Where Name = 'Read_All_Access_To_Project_Data'];

    // Insert a record into Permission set Assignment
    PermissionSetAssignment objAssignPermissionSet = new PermissionSetAssignment();
    objAssignPermissionSet.AssigneeId = userId;
    objAssignPermissionSet.PermissionSetId = objPS.Id;

    // Insert record in DB
    insert objAssignPermissionSet;

    // write logic to send an email



}

}