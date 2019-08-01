@isTest
public class Test_Six_42 {
    @isTest
    static void call(){
        Demo_Six_42 six =new Demo_Six_42();
        six.create('Testing','888','Energy');
        Integer count =[select count() from Account where name='Testing' and phone='888'];
        System.assertEquals(1,count);
    }
    @isTest
    static void invoke(){
        Test_Data_42_Example_1.create();
        Demo_Six_42 six =new Demo_Six_42();
        six.updateData();
        List<Account> accounts =[select id ,rating from Account ];
        for(Account a:accounts){
            System.assertEquals('Cold',a.rating);
        }
    }
    @isTest
    static void test(){
        Test_Data_42_Example_1.create();
        Demo_Six_42 six =new Demo_Six_42();
        six.deleteData();
        List<Account> accounts =[select id from Account where createdDate=TODAY];
        System.assertEquals(0,accounts.size());
    }

}