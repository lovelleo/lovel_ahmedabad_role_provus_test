public with sharing class QuoteDto extends BaseDto {
  public Date endDate;
  public Date startDate;
  public String name;
  public QuoteDto() {
  }

  public QuoteDto(Quote__c quote) {
    super(quote);
    this.endDate = quote.EndDate__c;
    this.startDate = quote.StartDate__c;
    this.name = quote.Name;
  }

  public override SObject refreshSo() {
    return null;
  }
}
