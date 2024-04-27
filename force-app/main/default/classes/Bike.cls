public class Bike extends Vehicle{

    string bikeName;
    
    public Bike(string strbikeName) // 1 paramter
    {
        this.bikeName = strbikeName;
    }
    
    public void accelerate()
    {
        System.debug(bikeName + ' is running');
    }
}