// Data Binding - Helps to bind the data between the JS and the html page
// Otherwise,  helps to bind functions and properties between the JS and the HTML page
import { LightningElement } from 'lwc';

export default class PizzaOrder extends LightningElement {

    // properties or variables
    strpizzaName;
    iQuantity;


    // methods or function
    print()
    {
        console.log("hello");
    }

    displayPizzaname(event) 
    {
        //let Pizzname2 = document.getElementById("Pizzaname").value;
        //document.getElementById("outputmsg").textContent = Pizzname2;
        // find the pizzaa name from the input box
        
        const Pizzname2 = this.template.querySelector('input[data-id="inPizzaName"]').value;
        const Quantity= this.template.querySelector('input[data-id="inPizzaQuantity"]').value;

        this.strpizzaName = Pizzname2;
        this.iQuantity = Quantity;

        console.log (Pizzname2);
    }



}