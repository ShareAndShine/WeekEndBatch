import { LightningElement, wire } from 'lwc';
import getTotalOpenOppsAmount from '@salesforce/apex/OpportunityController.getTotalAmount';

export default class CloseDealsWidget extends LightningElement {

    OpenOppsTotalAmt; 
    
    //Step 1: Call apex method to get open deals total amount when the page is loaded
    // Option 1: Use Wire (Recommended cos it can be used inside  JS class like any other function)
    // Option 2: Use Imperative Apex 

    /*
    @wire("APEXMethodName", "parameters in JS object format")
    create a function to process the response or error as received from the method
    use {data, error} => 2 LWC system reserved key words that will hold the response from apex method 
    */

    @wire(getTotalOpenOppsAmount)
    processoutput({data, error})
    {
        if(data)
        {
            console.log('Amt is ' + data);
            this.OpenOppsTotalAmt = 'Total Open Deals ' + data;

        }
        else if(error)
        {
            console.log('Error is ' + error);
        }
    }

   


}