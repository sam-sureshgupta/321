public class Demo_Six_42 {
    public void create(String name,String phone,String industry){
        Account acc =new Account();
        acc.Name=name;
        acc.phone=phone;
        acc.industry=industry;
        insert acc;
    }
    public void updateData(){
        List<Account> accounts =[select id,rating from Account ];
        for(Account a: accounts){
            a.rating='Cold';
        }
        update accounts;
    }
    public void deleteData(){
        List<Account> accounts =[select id from Account where createdDate=TODAY];
        delete accounts;
    }
}