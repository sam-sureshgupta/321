public class Apex_Example_23_6 {
    public String accName     {set;get;}
    public string accRating    {set;get;}
    public String accPhone    {set;get;}
    public String accIndustry  {set;get;}
    public void create(){
        
        try{
            Account data =new Account();
            data.Name=accName;
            data.rating=accRating;
            data.phone=accPhone;
            data.industry=accIndustry;
            insert data;
            System.debug('Insertion Success');
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Record saved Successfully');
            Apexpages.addMessage(msg);
        }catch(Exception e){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.ERROR,''+e.getCause());
            Apexpages.addMessage(msg);
        }
    }
}