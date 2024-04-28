public with sharing class StaticMethod {
    
    // Constructor  - Parameter less or default constructor
    public StaticMethod() {

    }


    /* Static method and variables are something that is shared between the objects */

    // attributes or properties
    public static String ProductType; // static variable
    public string ProductPrice; //non-static variable

    public static decimal Discount;

    public void ProductName(String strName)
    {
        System.debug('Product Name is '  + strName);
        System.debug('Product Type is '+ ProductType);
        System.debug('Discount is '+ Discount);
        
    }

    public static void setProductDiscount()
    {
        if(Discount == null)
        {
           Discount = 8;
        }
 
    }
    

}