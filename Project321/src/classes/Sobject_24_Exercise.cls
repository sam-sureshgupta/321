public class Sobject_24_Exercise {
    public Opportunity opt {set;get;}
    public Sobject_24_Exercise(){
        opt=new opportunity();
    }
    public PageReference create(){
        PageReference p;
        try{
            insert opt;
            p= new PageReference('/'+opt.Id);
        }catch(Exception e){
             Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR,e.getMessage());
            Apexpages.addMessage(msg);
        }
        return p;
    }
    
    public void cancel(){
         opt=new opportunity();
    }
     
}