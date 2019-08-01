@isTest
public class Test_Four_42 {
    @isTest
    static void testMe(){
        Demo_Four_42 four = new Demo_Four_42();
        four.industry='Energy';
        four.call();
        System.assertEquals('Hot',four.rating);
        System.assertEquals('New',four.status);
        four.industry='Education';
        four.call();
        System.assertEquals('Cold',four.rating);
        System.assertEquals('Existing',four.status);
    }

}