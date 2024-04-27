public class Electronics {
    
    // default constructor
    public Electronics() {}
    
    // attributes
    public string productType;
    
    public Product phone;
    
    // public methods
    public Product createPhoneProduct()
    {
        this.productType = 'Electronics';
        
        this.phone = new Product();
        this.phone.ProductId = 1;
        this.phone.ProductSKU = 'SKU-101';
        this.phone.ProductName = 'Redmi';
        this.phone.Quanity = 10;
        
        /*Product objProd = new Product();
        objProd.ProductId = 1;
        objProd.ProductSKU = 'SKU-101';
        objProd.ProductName = 'Redmi';
        objProd.Quanity = 10;*/
        
        System.debug('Product data:::' + this.phone);
        
        //return 'success...product has been created';
        return this.phone;
        
    }
    
    public System.HttpResponse getResponse()
    {
        return null;
    }
    
    

}