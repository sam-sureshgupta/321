public class Demo_Eight_42 {
    public void callMe(){
        List<Opportunity> optyList =[select id,stagename,closeDate from Opportunity];
        for(Opportunity op:optyList){
            op.stageName='Prospecting';
            op.closeDate=System.today()+15;
        }
        update optyList;
    }
    public void changeOwner(){
        List<Opportunity> optyList =[select id,stagename,closeDate from Opportunity  where createdDate=TODAY];
        user u =[select id from user where alias='jdoe'];
        for(Opportunity op:optyList){
            op.ownerId=u.id;
        }
        update optyList;
        
    }
}