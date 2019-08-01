@isTest
public class Test_Five_42 {
    @isTest
    static void call(){
        Demo_Five_42 five = new Demo_Five_42();
        five.exp=6;
        five.call();
        System.assertEquals(50000,five.salary);
        System.assertEquals(999,five.bonus);
        five.exp=2;
        five.call();
        System.assertEquals(60000,five.salary);
        System.assertEquals(444,five.bonus);
    }

}