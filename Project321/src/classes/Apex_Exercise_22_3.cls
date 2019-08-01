public class Apex_Exercise_22_3 {
    
    public String firstName     {set;get;}
    public String lastName   {set;get;}
    public String mobile   {set;get;}
    public String email  {set;get;}
    
    public void create(){
        Contact con =new Contact();
        con.firstname=firstName;
        con.lastname=lastName;
        con.mobilephone=mobile;
        con.email=email;
        insert con;
        ApexPages.Message msg =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Record Saved Successfully');
        Apexpages.addMessage(msg);
    }
}