public class Product {
    
    public Product() {}
    
    // properties
    public Integer ProductId;
    public String ProductSKU;
    public Integer Quantity;
    
    private String ProductName;    
    private Decimal Price;
    
    // Getter for Price Property
    public Decimal getPriceWithDiscount()
    {
        return this.Price; // exposing private property thru a public property
    }
    
    // Setter property for Price
    public void setPriceWithDiscount(Decimal newPrice)
    {
        newPrice = newPrice - (newPrice * 0.1);  // change the price before it is exposed
        this.Price = newPrice;
    }
    
    public void createProductData()
    {
        this.ProductId = 123;
        this.Price = 150;
    }
  
}