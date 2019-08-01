@isTest
public class Test_One_42 {
    @isTest
    static void testMe(){
        Demo_One_42 one = new Demo_One_42();
        one.callMe();
        System.assertEquals('Satish', one.name);
        System.assertEquals('Hyd', one.city);
    }

}