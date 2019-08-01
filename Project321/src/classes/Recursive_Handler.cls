public class Recursive_Handler {
    public static Boolean flag=true;
    public static void callMe(){
        if(flag==true){
            flag=false;
            Account acc =new Account();
            acc.Name='Testing';
            acc.Phone='040-1234';
            insert acc;
        }
    }    
}