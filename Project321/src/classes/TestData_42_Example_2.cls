@isTest
public class TestData_42_Example_2 {
    public static void create(){
        Opportunity op =new Opportunity();
        op.Name='Testing1';
        op.StageName='Qualification';
        op.closeDate=System.today();
        insert op;
    }
}