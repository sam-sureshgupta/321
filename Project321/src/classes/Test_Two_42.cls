@isTest
public class Test_Two_42 {
    @isTest
    static void testMe(){
        Demo_Two_42 two = new Demo_Two_42();
        two.invoke();
        System.assertEquals('Energy', two.industry);
        System.assertEquals('Hot', two.rating);
        two.show();
        System.assertEquals('Education', two.industry);
        System.assertEquals('Cold', two.rating);
    }

}