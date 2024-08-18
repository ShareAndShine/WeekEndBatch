//https://creative-fox-ajc92x-dev-ed.trailblaze.lightning.force.com/services/apexrest/api/contact/0035j00001OnStdAAF

// Desired output - https://creative-fox-ajc92x-dev-ed.trailblaze.lightning.force.com/services/apexrest/api/contactservicecontactservice/Jimmy
// declare that this class is a web service 
@RestResource(urlMapping='/ContactWS/*')
global with sharing class ContactService {
    


    // Sample input : https://creative-fox-ajc92x-dev-ed.trailblaze.lightning.force.com/services/apexrest/api/contactservice/Jimmy
    @HttpGet
    global static List<Contact> getContactDetailByName()
    {
        RestRequest req = RestContext.request; // Help to access the service URL
        RestResponse res = RestContext.response; // use this class to send response back to the caller

        // read the input contact name
        String strContactName = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); // get the contact name from the URL

        List<Contact> oContactresult = [SELECT Id, Name, Email, Phone FROM Contact WHERE Name LIKE :(strContactName + '%')];
        System.debug('oContactresult:' + oContactresult);
        return oContactresult;

    }

    // Sample input : https://creative-fox-ajc92x-dev-ed.trailblaze.lightning.force.com/services/apexrest/api/contactservice/0035j00001OnStdAAF
    @HttpDelete
    global static void DeleteContactDetailById()
    {
        RestRequest req = RestContext.request; // Help to access the service URL
        RestResponse res = RestContext.response; // use this class to send response back to the caller

        // read the input contact name
        String strContactID = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); // get the contact name from the URL

        Contact oContactresult = [SELECT Id, Name, Email, Phone FROM Contact WHERE Id =:strContactID];

        delete oContactresult;    
        

    }

}