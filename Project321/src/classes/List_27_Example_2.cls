public class List_27_Example_2 {
    public List<Account_Details> accounts {set;get;}
    public List_27_Example_2(){
        accounts =new List<Account_Details>();
        List<Account> myList =[select Name,Phone,Industry from Account ];
        for(Account a:myList){
              Account_Details d =new Account_Details();
              d.name=a.name;
              d.phone=a.phone;
              d.industry=a.industry;
              if(a.industry=='Energy')
                    d.amount=50000;
              else 
                    d.amount=30000;
              d.flag=false;
              accounts.add(d);
            
        }        
    }
}