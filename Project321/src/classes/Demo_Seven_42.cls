public class Demo_Seven_42 {
    public void create(String lastName,String firstName,String company){
        Lead l =new Lead();
        l.lastName=lastName;
        l.firstName=firstName;
        l.company=company;
        insert l;
    }
    public void invoke(String lastName,String firstName,String company){
        Integer count =[select count() from Lead where firstName=:firstName];
        if(count<=0){
          Lead l =new Lead();
          l.lastName=lastName;
          l.firstName=firstName;
          l.company=company;
          insert l;
        }
    }
}