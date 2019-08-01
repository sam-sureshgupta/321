public class Sobject_24_Example {
    
    public Account acc {set;get;}
    public Contact con {set;get;}
    
    public Sobject_24_Example(){
        acc=new Account();
        con=new Contact();
    }
    
    public PageReference create(){
        PageReference p;
        try{
            insert acc;
            con.AccountId=acc.Id;
            insert con;
            p=new PageReference('/'+acc.Id);
        }catch(Exception e){
            Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR,e.getMessage());
            ApexPages.addMessage(msg);
        }
        return p;
    }

}