//https://creative-fox-ajc92x-dev-ed.trailblaze.lightning.force.com/services/apexrest/productapi

@RestResource(urlMapping='/productapi/*')
global with sharing class ProductWebService {
   

    @HttpPost
    global static Id createNewProduct(String strProductCode,String strProductName, String strProductDesc ) {
        
        try {
            
            Product2 objPrdRec = new Product2();
            objPrdRec.Name = strProductName;
            objPrdRec.ProductCode = strProductCode;
            objPrdRec.Description = strProductDesc;

            //insert
            Database.insert(objPrdRec, true);

            return objPrdRec.Id;

        } catch (Exception ex) {
            
            return '0000';
        }
    }

    @HttpGet
    global static List<Product2> getAllProducts()
    {
        
        List<Product2> oProductresult = [SELECT Id, Name  FROM Product2];
        System.debug('oProductresult:' + oProductresult);
        return oProductresult;

    }


}