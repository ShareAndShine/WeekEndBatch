public with sharing class LearnCollections {
    public LearnCollections() {

    }

    public static List<Integer> SimpleList()
    {
        // manage list of numbers
        List<Integer> lstNumbers = new List<Integer>();

        lstNumbers.add(1);
        lstNumbers.add(2);
        lstNumbers.add(3);
        lstNumbers.add(4);
        lstNumbers.add(5);

        return lstNumbers;

    }

    public static void ListCodeSnippets()
    {
        List<Account> lstAccs = [SELECT Id, Name, Industry FROM Account WHERE Industry = 'Agriculture'];
        List<Opportunity> lstOpps = [SELECT Id, Name, Account.Name FROM Opportunity LIMIT 10];
        List<Attendance_Register__c> lstAttendance = [SELECT Id, Name , Attendance_Status__c, Attendance_Log_Date__c FROM Attendance_Register__c];

        // if you are abosulety sure abt the query that return single record. Then you can avoid using List
        User usrRec = [SELECT Id, Name, Email, Profile.Name FROM User WHERE username = 'reader.vm@creativepanda.com'];
        Account accRecord = [SELECT Id, Name FROM Account  WHERE ID = '0015j00001aUuycAAC'];

        System.debug('lstAccs ::' + lstAccs);
        System.debug('lstOpps ::' + lstOpps);
        System.debug('lstAttendance ::' + lstAttendance);

        // Print Account Name and Industry alone for each account
        for(Account accRec :lstAccs)
        {
            System.debug('Account Name:'+ accRec.Name);
            System.debug('Account Industry:'+ accRec.Industry);
        }

        // Print Opportunity Name and Account Name alone for each opportunity
        for(Opportunity oppRec : lstOpps)
        {
            System.debug('Opp Name:: ' + oppRec.Name + ' - ' + 'Account Name:: ' + oppRec.Account.Name);
        }

        //PRint User info
        System.debug('User Name::' + usrRec.Name);
        System.debug('User Email::' + usrRec.Email);
        System.debug('User Profile Name::' + usrRec.Profile.Name);
    }

    public static void getAccounts()
    {
        String szIndustry = 'Agriculture';
        String szActive = '';

        List<Account> lstAccs = [SELECT Id, Name, Industry FROM Account WHERE Industry = :szIndustry AND Active__c = :szActive];

        // Print Account Name and Industry alone for each account
        for(Account accRec :lstAccs)
        {
            System.debug('Account Name:'+ accRec.Name);
            System.debug('Account Industry:'+ accRec.Industry);
        }

    }

    public static void showAccountsByIndustry(String strInputIndustry)
    {
        String szIndustry = strInputIndustry;
        String szActive = '';

        List<Account> lstAccs = [SELECT Id, Name, Industry FROM Account WHERE Industry = :szIndustry AND Active__c = :szActive];

        // Print Account Name and Industry alone for each account
        for(Account accRec :lstAccs)
        {
            System.debug('Account Name:'+ accRec.Name);
            System.debug('Account Industry:'+ accRec.Industry);
        }

    }


    public static List<Account> getAccountsByIndustry(String strInputIndustry)
    {
        String szIndustry = strInputIndustry;
        String szActive = '';

        List<Account> lstAccs = [SELECT Id, Name, Industry FROM Account WHERE Industry = :szIndustry AND Active__c = :szActive];

        return lstAccs;

    }

    public static void SimpleMapCollection()
    {
        // collection to hold list of Months
        List<String> objMonths = new List<String>();

        // Adding Months to the collection
        objMonths.add('January');
        objMonths.add('February');
        objMonths.add('March');
        objMonths.add('April');
        objMonths.add('May');

        // Syntax For Map
        //Map<'key-Datatype', 'Actualdata-Datatype'> objMapMonths = new Map<'key-Datatype', 'Actualdata-Datatype'>();

        Map<Integer, String> objMapMonths = new Map<Integer, String>();

        // Adding Months to the Map
        objMapMonths.put(1, 'January');
        objMapMonths.put(2, 'February');
        objMapMonths.put(3, 'March');
        objMapMonths.put(4, 'April');


        System.debug('Month 4 is ' + objMapMonths.get(4));
        System.debug('Month 2 is ' + objMapMonths.get(2));


        // Discount By Customer Tier
        Map<String, Decimal> discountByCustomerTier = new Map<String, Decimal>();
        discountByCustomerTier.put('tier1', 10);
        discountByCustomerTier.put('tier2', 8);
        discountByCustomerTier.put('tier3', 5);
        
        System.debug('Discount for Tier 3 customer is ' + discountByCustomerTier.get( 'tier3' ));
        

    }

    public static Map<Integer, Month> MapCollectionWithObjects()
    {
        // Actual data
        Month objJan = new Month('Jan',2024,4,31);
        Month objFeb = new Month('Feb',2024,5,28);
        Month objMar = new Month('Mar',2024,4,30);

        //Map<'key-Datatype', 'Actualdata-Datatype'> objMapMonths = new Map<'key-Datatype', 'Actualdata-Datatype'>();

        Map<Integer, Month> objMapMonths = new Map<Integer, Month>();

        // Adding Months to the Map
        objMapMonths.put(1, objJan); // using map to hold a class content
        objMapMonths.put(2, objFeb);
        objMapMonths.put(3, objMar);

        //System.debug('Month 2 is ' + objMapMonths.get(2));
        //System.debug('Month 3 is ' + objMapMonths.get(3));

        // get the month name and total weekends for Feb
        //System.debug('Month 2 is ' + objMapMonths.get(2).monthName);
        //System.debug('Month 2 is ' + objMapMonths.get(2).totalWeekEnds);
        

        
        List<Month> lstMonth = new List<Month>();
        lstMonth.add(objJan);
        lstMonth.add(objFeb);
        lstMonth.add(objMar);

        return objMapMonths;
    }

    public static string GetName()
    {
        string szname = 'Rajesh';
        return szname;
    }



}



















