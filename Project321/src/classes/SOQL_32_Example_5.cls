public class SOQL_32_Example_5{
    //accountName
    public String accName {set;get;}
    //account rating 
    public String accRating {set;get;}
    //query String
    public String query {set;get;}
    //Result fetched
    public List<Account> accounts {set;get;}
    public SOQL_32_Example_5(){
        accounts = new List<Account>();
    }
    
    public void search(){
        // Default query 
        query='select id,name,phone,rating,industry from Account';
        // if accName and accRating values are entered
        // where name='TCS' and Rating ='Hot' 
        if(accName!=''&&accRating!=''){
            query=query+' where name=\''+accName+'\' and rating=\''+accRating+'\'';            
        }else{
            // if only name is entered 
            // where name='TCS'
            if(accName!=''){
                query=query+' where name=\''+accName+'\'';
            }else if(accRating!=''){
                // if only rating is entered
                // where rating='Hot'
                query=query+' where rating=\''+accRating+'\'';
            }
        }
        accounts = Database.query(query);
    }
}