public with sharing class AutoNumberGenerator {
    public AutoNumberGenerator() {

    }

    // Method to generate a random autonumber
    public static String generateRandomAutoNumber() {
        Integer min = 100000;
        Integer max = 999999;
        Integer randomNum = Math.round(Math.random() * (max - min) + min);
        return String.valueOf(randomNum);
    }
// Method to generate a random autonumber
public static String generateNextAvailableAccountNumber() {
    
    return null;
}

}