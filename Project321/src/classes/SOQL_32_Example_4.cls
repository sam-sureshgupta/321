public class SOQL_32_Example_4 {
    // Keyword which we want to search
    public String searchText    {set;get;}
    // list of records which we fetched
    public List<Account> accounts   {set;get;}
    public void search(){
        String query='select Name,Phone,Industry,Rating,Type from Account  where name like';
        query=query+' \'%'+searchText+'%\'';
        accounts=Database.query(query);        
    }    

}