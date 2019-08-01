public class SOQL_31_Example_2 {
    public List<Account> accounts {set;get;}
    public SOQL_31_Example_2(){ 
        // 1. This will fetch all the accounts from the Account sobject
        accounts =[select Name,Phone,Industry,Rating from Account];
    }
    //1. Limit : 
    //   This will specify how many records should be returned from the queryResult
    public void limitData(){
         accounts =[select Name,Phone,Industry,Rating from Account limit 5];
    }
    // 2. if you want to use variable in the soql then define ":variable name"
    public void setLimit(){
        Integer count=2;
         accounts =[select Name,Phone,Industry,Rating from Account limit :count];
    }
    // 3. offset : 
    //  This will specify from which position result should be returned
    //  Maximum value of offset is 2000
    public void offsetData(){
        accounts =[select Name,Phone,Industry,Rating from Account offset 5];
    }
    public void setoffset(){
          Integer count=15;
         accounts =[select Name,Phone,Industry,Rating from Account offset :count];
    }
    // Order by <FieldName>[ASC/DESC]
    // order by Name ASC
    // Order by Phone DESC
    // Order by Name ASC ,Phone DESC
    public void nameAsc(){
         accounts =[select Name,Phone,Industry,Rating from Account order by Name ];
    }
    public void nameDesc(){
         accounts =[select Name,Phone,Industry,Rating from Account order by Name DESC ];
    }
    public void nameAscPhoneDesc(){
         accounts =[select Name,Phone,Industry,Rating from Account order by Name ASC ,Phone Desc ];  
    }
}