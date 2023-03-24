public without sharing class editQuoteController {
    public editQuoteController() {

    }
    @AuraEnabled
    public static string updateQuote(Quote__c Quote){
        try {
            update Quote;
            return 'success';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static Quote__c getQuote(String quoteId){
        system.debug('QuoteId-->'+quoteId);
        try {
            Quote__c oQuote = [Select EndDate__c,StartDate__c,Name from Quote__c where Id =:quoteId];
            return oQuote;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}