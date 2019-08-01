public class Apex_Example_22_2 {
    
    public String name     {set;get;}
    public String phone   {set;get;}
    public String rating   {set;get;}
    public String industry  {set;get;}
    public void create(){
        Account acc =new Account();
        acc.Name=name;
        acc.Phone=phone;
        acc.rating=rating;
        acc.industry=industry;
        insert acc;
        ApexPages.Message msg =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Record Saved Successfully');
        Apexpages.addMessage(msg);
    }
}