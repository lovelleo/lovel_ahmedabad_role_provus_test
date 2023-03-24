/*
 * Provus Services Quoting
 * Copyright (c) 2023 Provus Inc. All rights reserved.
 */

import { LightningElement, api } from "lwc";
import updateQuote from '@salesforce/apex/editQuoteController.updateQuote';
import getQuote from '@salesforce/apex/editQuoteController.getQuote';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EditQuote extends LightningElement {
  @api recordId;
  quoteData = {};
  connectedCallback() {
    debugger;
    this.getQuoteDetails();
  }
  renderedCallback() {
    
  }
  getQuoteDetails(){
    getQuote({ 
        quoteId : this.recordId
      }).then(result => {
        this.quoteData = result;
      })
    .catch(error => {
        const event = new ShowToastEvent({
            title : 'Error',
            message : 'Error updating Quote Dates. Please Contact System Admin',
            variant : 'error'
        });
        this.dispatchEvent(event);
    });
  }
  captureStartDate(event){
    this.quoteData.StartDate__c = event.target.value;
  }
  captureEndDate(event){
    this.quoteData.EndDate__c = event.target.value;
  }
  onSaveClicked(){
    this.quoteData.id = this.recordId;
    updateQuote({ 
      Quote : this.quoteData
    }).then(result => {
      const event = new ShowToastEvent({
          title: 'Quote Updated',
          message: 'Quote Dates updated successfully',
          variant: 'success'
      });
      this.dispatchEvent(event);
  })
  .catch(error => {
      const event = new ShowToastEvent({
          title : 'Error',
          message : 'Error updating Quote Dates. Please Contact System Admin',
          variant : 'error'
      });
      this.dispatchEvent(event);
  });
  }
}
