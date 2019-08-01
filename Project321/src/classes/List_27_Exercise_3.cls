public class List_27_Exercise_3 {
public Contact con {set;get;}
    public List_27_Exercise_3(){
        con =new Contact();
    }
    public PageReference create(){
        PageReference p;
        List<Contact> contacts =[select firstName, lastName, phone, email from contact];
        Integer count =contacts.size();
        if(count>=30){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'We Can Not insert new records');
            Apexpages.addMessage(msg);
        }else{
            insert con;
            p =new PageReference('/'+con.Id);
        }
        return p;
    }
}