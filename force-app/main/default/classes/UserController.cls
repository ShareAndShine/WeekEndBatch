public with sharing class UserController 
{



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


    @future    
    public static void assignPermissionSetToUser(Set<Id> stuserIds)
    {

        // get the permission set
        PermissionSet objPS = [SELECT Id, Name FROM PErmissionSet Where Name = 'Read_All_Access_To_Project_Data'];

        // Insert a record into Permission set Assignment
        List<PermissionSetAssignment> lstPermissionSetAssignmentToBeInserted = new List<PermissionSetAssignment>();
        
        // loop thru each user being created 
        // and create one permission set assignment record 
        // and add the permission set asssignment record to a collection
        // and run a insert with collection 

        for(Id userId: stuserIds)
        {
            
            PermissionSetAssignment objAssignPermissionSet = new PermissionSetAssignment();
            objAssignPermissionSet.AssigneeId = userId;
            objAssignPermissionSet.PermissionSetId = objPS.Id;

            lstPermissionSetAssignmentToBeInserted.add(objAssignPermissionSet);
        }
        

        // Insert record in DB
        insert lstPermissionSetAssignmentToBeInserted;

        // write logic to send an email
    }

    @future    
    public static void assignSalesUserToPublicGroup(Id userId)
    {
        // get the public group
        Group objGroup = [SELECT Id, Name, DeveloperName FROM Group WHERE DeveloperName = 'All_Hands_Sales'];

        Id groupId = objGroup.Id; // Read Id value and store in a variable


        // Insert a record into GroupMember
        GroupMember objGroupMember = new GroupMember();
        objGroupMember.UserOrGroupId = userId;
        objGroupMember.GroupId = groupId;

        insert objGroupMember;    

    }

    @future    
    public static void assignSalesUserToChatterGroup(Id userId)
    {
        // get the chatter group Id
        CollaborationGroup objCollaborationGroup =  [SELECT Id, Name FROM CollaborationGroup WHERE Name = 'Global Sales Users'];

        Id CollabrationgroupId = objCollaborationGroup.Id; // Read Id value and store in a variable

        // Insert a record into GroupMember
        CollaborationGroupMember objCollaborationGroupMember = new CollaborationGroupMember();
        objCollaborationGroupMember.CollaborationGroupId = CollabrationgroupId;
        objCollaborationGroupMember.MemberId = userId;

        insert objCollaborationGroupMember;

        // Send a post message to welcome the user
        FeedItem objFeed = new FeedItem();
        objFeed.ParentId = CollabrationgroupId;
        objFeed.title = 'Welcome';
        objFeed.Body = 'Hi ' + userId + ' Welcome to the chatter group';

        insert objFeed;

    }




}