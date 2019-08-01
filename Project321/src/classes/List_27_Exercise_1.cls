public class List_27_Exercise_1 {
    
    public List<Account> accounts {set;get;}
    public Account s {set;get;}
    public List_27_Exercise_1(){
        s=new Account();        
        accounts =new List<Account>();        
    }
    public void addMe(){       
        
        try{
            insert s;
            accounts.add(s);
        }catch(Exception e){
            Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR,e.getMessage());
            ApexPages.addMessage(msg);
        }        
       s=new Account(); 
    }
}