import { LightningElement } from 'lwc';

// enables LWC to access the apex method
import createContact from '@salesforce/apex/ContactController.createContact';
import getListOfAllContacts from '@salesforce/apex/ContactController.getAllContacts';


export default class ContactForm extends LightningElement {


 handlecreateContact()
 {
    console.log("create contact");

    // Step 1: read first name and last name from the form
    const cfirstName = this.template.querySelector('[data-id="fName"]').value;
    const clastName = this.template.querySelector('[data-id="lName"]').value;
    const cemail = this.template.querySelector('[data-id="emailaddress"]').value;

    // print the values in the console
    console.log(cfirstName);
    console.log(clastName);
    console.log(cemail);

    // Step 2: call the apex method createContact
    // Use JS object format to pass the values to the apex method
    let newContactRec = {firstName: cfirstName, lastName: clastName, email: cemail};
    
    createContact(newContactRec)
    .then( () => {
        // success code
        console.log("Contact created successfully");
    })
    .catch( () => {
        // error code
        console.log("Error creating contact");
    });


    getListOfAllContacts()
    .then( (result) => {
        //success code
        console.log("Contact retrieved successfully::" + JSON.stringify(result));
    } )
    .catch( (error)=> {
        //error code
        console.log("Error retrieving contact::" + error);
    });

}

}