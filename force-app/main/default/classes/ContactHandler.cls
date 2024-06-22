public with sharing class ContactHandler {
    public ContactHandler() {

    }


    public static void ContactDeleteValidation(List<Contact> lstContactsMarkedForDelete)
    {
        Set<Id> contactIds = new Set<Id>();
    

        // Collect Contact IDs from the trigger
        for(Contact con : lstContactsMarkedForDelete) {
            contactIds.add(con.Id);
        }

        // Query to find open cases related to these contacts
        List<Case> openCases = [
            SELECT Id, ContactId 
            FROM Case 
            WHERE ContactId IN :contactIds 
            AND Status NOT IN ('Closed', 'Resolved')
        ];
        
        // Set of Contact IDs with open cases
        Set<Id> contactsWithOpenCases = new Set<Id>();
        for(Case caseRecord : openCases) {
            contactsWithOpenCases.add(caseRecord.ContactId);
        }
        
        // Prevent deletion if there are open case records associated with the contact being deleted 
        for(Contact con : lstContactsMarkedForDelete) {
            if(contactsWithOpenCases.Contains(con.Id)) {
                con.addError('This contact cannot be deleted because it has associated open cases.');
            }
        }
    }


    public static void ContactDeleteValidationOnContracts(List<Contact> lstContactsMarkedForDelete)
    {
        // code logic 
    }

    public static void SendEmailToContacts(List<Contact> lstContacts)
    {
        // loop thru contacts and send email
    }

    public static void ActiveEmailCheck(List<Contact> lstContacts)
    {
        // Step 1: Loop thru contacts

        // Step 2: Collect all email addresses in a list

        // Step 3: Send a call to aPI with email address

        // Step 4: Check if email is active or not
    }
    
    
}