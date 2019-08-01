public class Demo_Four_42 {
    public String industry;
    public String rating;
    public String status;
    public void call(){
        if(industry=='Energy'){
            rating='Hot';
            status='New';
        }else{
            rating='Cold';
            status='Existing';
        }
    }
}