public class Apex_Page_Message {
    public Apex_Page_Message(){
        Apexpages.Message msg1 =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Success Message');
        Apexpages.addMessage(msg1);
        
        Apexpages.Message msg2 =new Apexpages.Message(Apexpages.Severity.ERROR,'Error Message');
        Apexpages.addMessage(msg2);
            
        Apexpages.Message msg3 =new Apexpages.Message(Apexpages.Severity.WARNING,'Warning Message');
        Apexpages.addMessage(msg3);
        
        Apexpages.Message msg4 =new Apexpages.Message(Apexpages.Severity.INFO,'This is information');
        Apexpages.addMessage(msg4);
    }
}