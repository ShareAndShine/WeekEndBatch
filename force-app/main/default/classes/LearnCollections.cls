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
}