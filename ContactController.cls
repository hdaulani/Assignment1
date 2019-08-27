public with sharing class ContactController {
    public Contact varContact;
    public ContactController(ApexPages.StandardController con){
        varContact = (Contact)con.getRecord();
    }
    public PageReference saveContact(){
        
        varContact.Summary__c = 'Contact Details of ' + varContact.FirstName + ' ' + varContact.LastName + ' (Ji)'+' : Phone - ' + (varContact.Phone == null ? 'N.A.' : varContact.Phone) + ', Email: ' + (varContact.Email == null ? 'N.A.' : varContact.Email);
        upsert varContact;
        return new PageReference('/'+varContact.Id);
    }
}