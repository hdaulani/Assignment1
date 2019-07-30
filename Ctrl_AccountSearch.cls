public with sharing class Ctrl_AccountSearch {
    String BaseQuery = 'select Id, Name, BillingCity, BillingState, BillingCountry from Account';
    String LimitString = ' Limit 10';
    public List<Account> accounts 
    { 
        get
        {
           return Database.query(BaseQuery + LimitString);
        }
        set; 
    }
    
    
    
    
    public String name { get; set; }
    public String billingCity { get; set; }
    public String billingState { get; set; }
    public String billingCountry { get; set; }
    public Ctrl_AccountSearch()
    {
        accounts = new List<Account>();
    }
    public PageReference searchAccounts()
    {
        accounts = Database.query(BaseQuery + LimitString);
		return null;
    }
    
}