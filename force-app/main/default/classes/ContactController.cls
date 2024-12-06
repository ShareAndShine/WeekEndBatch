public with sharing class ContactController {
    public ContactController() {

    }

    // method to create a contact by taking first name, last name and email as input
    @AuraEnabled    
    public static Contact createContact(String firstName, String lastName, String email) {
            
        Contact contact = new Contact(FirstName=firstName, LastName=lastName, Email=email);
        insert contact;
        return contact;
    }

    // method to get all contacts
    @AuraEnabled(cachable=true)   
    public static List<Contact> getAllContacts() {
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact];
        return contacts;
    }
}