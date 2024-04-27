public class Car {
    // Instance variable to track whether the car engine is running
    private Boolean isRunning;

    // Parameterless constructor
    public Car() {
        // Initialize isRunning to false by default
        this.isRunning = false;
    }

    // Method to start the car engine
    public void startEngine() {
        // Set isRunning to true
        this.isRunning = true;
    }

    // Getter method to retrieve the current status of the engine
    public Boolean getIsRunning() {
        return this.isRunning;
    }
    
    public Boolean IsBiryaniReady()
    {
        // logic
        
        return true;
    }
    
    public string getEngineMakeYear()
    {
        return '2024';
    }
}