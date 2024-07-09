public with sharing class AccountHelper {
    public AccountHelper() {

    }


    public static void CreateOpportunties(List<Account> accsNew)
    {
        List<Opportunity> newOppsToBeInserted = new List<Opportunity>();
        // Loop thru all the accounts and 
        // create one opportunity for each account for which industry is Agriculture

        for(Account acc: accsNew)
        {
            if(acc.Industry == 'Agriculture')
            {
                // create a nee opportunity
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name +' - Opportunity';
                opp.StageName = 'Prospecting';
                opp.Amount = 0;
                opp.CloseDate = System.today() + 90;
                opp.AccountId = acc.Id;

                newOppsToBeInserted.add(opp);

                System.debug('Opp to be inserted:: ' + opp);
                //insert opp;
            }

        }
        //Sanity check
        if(newOppsToBeInserted.size() > 0)
        {
            insert newOppsToBeInserted;
        }
    }
}