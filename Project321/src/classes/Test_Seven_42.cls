@isTest
public class Test_Seven_42 {
    @isTest
    static void test(){
        Demo_Seven_42 seven = new Demo_Seven_42();
        seven.create('Gup','Suresh','ABC');
        Integer count = [select count() from lead where lastName='Gup' and firstName='Suresh'];
        System.assertEquals(1, count);
        seven.invoke('N','Ravindra','Capital');
        Integer size=[select count() from lead];
        System.assertEquals(2,size);
        seven.invoke('N','Ravindra','Capital');
        Integer mycount =[select count() from lead];
        System.assertEquals(2,mycount);
    }
}