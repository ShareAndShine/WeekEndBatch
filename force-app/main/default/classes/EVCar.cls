public with sharing class EVCar implements  Vehicle{
    public EVCar() {

    }

    public void startCar()
    {
        // write your logic to start the space craft
        // check fuel
        // check oil
        // check electic circuits
        // check all the parts
        // start the car
    }

    public void stopCar()
    {
        // write your logic to stop the space craft
        
    }

    public void accelerate()
    {
         // write your logic to accelerate   
        
    }

    public void brake(String bType)
    {
         // write your logic to accelerate   
        
    }

    public Integer  getSpeed()
    {
         // write your logic to get speed 
         // show speed in analog display 
         Integer speed = CalculateCurrentSpeed();
         return   speed;
        
    }

    public void OpenMoonRoof()
    {
        //write logic to open moon roof window
    } 


    private Integer CalculateCurrentSpeed()
    {
        return 40;
    }
}
