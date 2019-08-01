@isTest
public class Test_Three_42 {
    @isTest
    static void testMe(){
        Demo_Three_42 three = new Demo_Three_42();
        three.call();
        System.assertEquals('Private', three.ownership);
        System.assertEquals('Hot', three.rating);
        three.invoke();
        System.assertEquals('Cold', three.rating);
        System.assertEquals('New Customer', three.type);
    }
}