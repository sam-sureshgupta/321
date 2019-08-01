public class Apex_IntrestCalculator_22 {
    public Decimal amount {set;get;}
    public Decimal years {set;get;} 
    public Decimal rate {set;get;} 
    public Decimal intrest {set;get;}
    
    public void submit(){
        intrest=(amount*years*rate)/100;
            }
    
    public void cancel(){
        amount=null;
        years=null;
        rate=null;
        intrest=null;
            }
}