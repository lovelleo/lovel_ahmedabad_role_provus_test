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
    public static QuoteDto getQuote(String quoteId){
        system.debug('QuoteId-->'+quoteId);
        try {
            Quote__c oQuote = [Select Id, EndDate__c,StartDate__c from Quote__c where Id =:quoteId];
            QuoteDto oQuoteDto = new QuoteDto(oQuote);
            return oQuoteDto;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}