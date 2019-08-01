public class Apex_Example_23_7 {
    public String name      {set;get;}
    public String industry     {set;get;}
    public String phone      {set;get;}
    public String rating    {set;get;}
    public String lastName    {set;get;}
    public String firstName    {set;get;}
    public String email      {set;get;}
    public String otherPhone  {set;get;}
    public PageReference create(){
        PageReference p;
        Apexpages.Message msg ;
        try{
            Account acc =new Account();
            acc.Name=name;
            acc.Phone=phone;
            acc.Rating=rating;
            acc.Industry=industry;
            insert acc;
            Contact con =new Contact();
            con.LastName=lastName;
            con.FirstName=firstName;
            con.Email=email;
            con.otherphone=otherphone;
            con.AccountId=acc.Id;
            insert con;
            p=new PageReference('/'+acc.Id);
            
        }catch(Exception e){
            msg =new Apexpages.Message(Apexpages.Severity.Error,''+e.getCause());
             Apexpages.addMessage(msg);
        }
        return p;
    }

}