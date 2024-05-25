public with sharing class AccountContactManager {
    public AccountContactManager() {

    }

    //Use map to store list of 10 accounts having account ID as a key identifier

    public static Map<Id, Account> StoreAccountInfo()
    {

        // Get list of 10 accounts
        List<Account> lstAcc = [SELECT Id, Name, Industry, AnnualRevenue FROM Account];
    
        
        //Map<'key-Datatype', 'Actualdata-Datatype'> objMapMonths = new Map<'key-Datatype', 'Actualdata-Datatype'>();

        // Create a map of account ID to account name
        Map<Id, Account> mapAcc = new Map<Id, Account>();
        //Account acc1 = new Account(Id= '001X338494030', name='Vanji Phrama Ltd', Industry='Agriculture', AnnualRevenue=1000000);
        //mapAcc.put('001X338494030', acc1);

        // loop thru account collection and
        // Copy the content into Map collection 
        // Stamp account id as key identifier and account object as value
        for(Account accRec : lstAcc)
        {
            mapAcc.put(accRec.Id, accRec);
        }

        System.debug('Map Collection For Accounts Data::' + mapAcc);

        return mapAcc;

        
    }


    public static void getAccountInfo(Id iAccId)
    {

           // call storeaccountInfo method to get the list of 10 accounts
           Map<Id, Account> mapAccsCollection = StoreAccountInfo();

           // check for key and then show the data
           if(mapAccsCollection.containsKey(iAccId))
           {
             System.debug('Account Info::' + mapAccsCollection.get(iAccId));
           }


        
    }


    public static Contact getContactsByTitle(string strTitle)
    {

        // get all contacts and store in a list
        List<Contact> lstConts = [SELECT Id, Name, Title, Phone, Email FROM Contact];

        // loop thru contact collection and
        // Copy the content into Map collection 
        // Stamp contact title as key identifier and contact object as value
        Map<String, Contact> mapConts = new Map<String, Contact>();

        for(Contact conRec : lstConts)
        {
            mapConts.put(conRec.Title, conRec);
        }

        // check if contact record is available for the given contact title
        // if yes, share the data
        if(mapConts.containsKey(strTitle))
        {
            //get the contact record

            Contact conRecord = mapConts.get(strTitle);
            return conRecord;

        }


    }








}