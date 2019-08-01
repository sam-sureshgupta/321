public class List_27_Example_3 {
    public Account acc {set;get;}
    public List_27_Example_3(){
        acc =new Account();
    }
    public PageReference create(){
        PageReference p;
        List<Account> accounts =[select Name from Account where name=:acc.Name];
        integer count =accounts.size();
        if(count> 0){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'Duplicate recrod exits');
            Apexpages.addMessage(msg);
        }else{
            insert acc;
            p =new PageReference('/'+acc.Id);
        }
        return p;
    }
}