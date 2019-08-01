@isTest
public class Test_Eight_42 {
    @isTest
    static void test(){
        TestData_42_Example_2.create();
        Demo_Eight_42 eight = new Demo_Eight_42();
        eight.callMe();
        Opportunity op = [select id, stageName, closeDate from opportunity];
        System.assertEquals('Prospecting', op.stageName);
        System.assertEquals(System.today()+15, op.closeDate);
        eight.changeOwner();
        User u =[select id from user where alias='jdoe'];
        Opportunity opty=[select id ,ownerId from Opportunity];
        System.assertEquals(u.Id,opty.ownerId);        
    }
}