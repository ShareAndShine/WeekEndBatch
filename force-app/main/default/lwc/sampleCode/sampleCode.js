import { LightningElement } from 'lwc';

 export default class SampleCode extends LightningElement {
    
    name = "Rajesh";    

    apikey  = "<KEY>";
    
    handleClick() {
        console.log("API Key: "+this.apikey);
    }

    printName() {
        console.log("Name: "+this.name);
    }
 }