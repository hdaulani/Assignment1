public with sharing class Ctrl_AccountSearch {
	private static final String v1 = '';
    String BaseQuery = 'select Id, Name, BillingCity, BillingState, BillingCountry from Account';
    String FinalQuery = BaseQuery;
    String whereStringbillingCity = '';
    String whereStringbillingState = '';
    String whereStringbillingCountry = '';
    String WhrCondition; 
    String LimitString = ' Limit 10';
    public List<Account> accounts 
    { 
        get
        {
            if(accounts == null)
            {
                accounts = Database.query(FinalQuery + LimitString);
            }
           return accounts;
        }
        set; 
    }
    
    public String billingCity { get; set; }
    public String billingState { get; set; }
    public String billingCountry { get; set; }
    
    public PageReference searchAccounts()
    {
        FinalQuery = BaseQuery;
        whereStringbillingCity = '';
        whereStringbillingState = '';
        whereStringbillingCountry = '';
            
        if(!String.isEmpty(billingCity))
        {
            whereStringbillingCity = 'billingCity = \'' + billingCity + '\' AND ';
        }
        
        if(!String.isEmpty(billingState))
        {
            whereStringbillingState = 'billingState = \'' + billingState + '\' AND ';
        }
        
        if(!String.isEmpty(billingCountry))
        {
            whereStringbillingCountry = 'billingCountry = \'' + billingCountry + '\' AND ';
        }
        
        if(!String.isEmpty(whereStringbillingCity) || !String.isEmpty(whereStringbillingState) || !String.isEmpty(whereStringbillingCountry))
        {
            FinalQuery = BaseQuery + ' WHERE ' + whereStringbillingCity + whereStringbillingState + whereStringbillingCountry;
            System.debug('FinalQuery ' + FinalQuery);
            FinalQuery = FinalQuery.substring(0, FinalQuery.length() - 5);
            System.debug('FinalQuery ' + FinalQuery);
        }
        
        accounts = Database.query(FinalQuery + LimitString);
		return null;
    }
}