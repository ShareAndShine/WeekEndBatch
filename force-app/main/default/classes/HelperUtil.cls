public class HelperUtil {
    public HelperUtil() {

    }

    //1st method to return current date and time
    public static Datetime getCurrentDateTime(){
        return Datetime.now();
    }

    // Use Case: CReate a method that returns current day , Date & time
    public static DateReponse getDateInfo()
    {

        // create an instance for class DateReponse
        DateReponse objDate = new DateReponse();

        // From APEXsystem classwe are getting current date and time in the below format
        objDate.currentDateTime = Datetime.now(); 
        
        // From APEX sysetem we are getting the day of the year in the below format        
        objDate.currentDayoftheYear = Date.today().dayOfYear();

        return objDate;
    }

    public static void getUserDetails() {
        // Retrieve the current user's details
        User currentUser = [SELECT Id, Username, Email, Profile.Name FROM User WHERE Id = :UserInfo.getUserId()];
        
        // Display the user's details
        System.debug('Current User ID: ' + currentUser.Id);
        System.debug('Current User Username: ' + currentUser.Username);
        System.debug('Current User Email: ' + currentUser.Email);
        System.debug('Current User Profile Name: ' + currentUser.Profile.Name);
    }

    public static void getCurrentOrgUrl() {
        // Get the current organization URL
        String currentOrgUrl = URL.getSalesforceBaseUrl().toExternalForm();
        
        // Display the current organization URL
        System.debug('Current Organization URL: ' + currentOrgUrl);
    }

    public static Integer getOddNumbers()
    {
        Integer value1 = 1;
        Integer value2 = 3;
        Integer value3 = 5;
        return value1;
    }

    public static OddNumbers getMultipleOddNumbers()
    {
        // create an instance for class oddnumbers
        OddNumbers objOdd = new OddNumbers();
        objOdd.value1 = 1;
        objOdd.value2 = 3;
        objOdd.value3 = 5;

        return objOdd;

    }


}