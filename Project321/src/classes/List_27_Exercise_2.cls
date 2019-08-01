public class List_27_Exercise_2 {
    
    public List<Account_Data> accdata {set;get;}
    
    public List_27_Exercise_2(){
        
        accdata =new List<Account_Data>();
        
        List<Account> accounts =[select Name,Phone,Industry from Account ];        
        
        for(Account a:accounts){
              Account_Data ad =new Account_Data();
              ad.acc=a;
              ad.flag=false;            
              accdata.add(ad);            
        }        
    }
    
}