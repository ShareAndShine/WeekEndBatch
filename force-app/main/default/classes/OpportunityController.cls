public with sharing class OpportunityController {
    public OpportunityController() {

    }

    // create an auraenabled method to get the total amount from open opportunities
    @AuraEnabled(cacheable=true)
    public static Decimal getTotalAmount(){
        AggregateResult result = [SELECT SUM(Amount),COUNT(Id) FROM Opportunity WHERE StageName !='Closed Won' And IsClosed = false];
        Decimal totalAmount = 0;
        totalAmount = (Decimal)result.get('expr0');
        return totalAmount;
    }
}