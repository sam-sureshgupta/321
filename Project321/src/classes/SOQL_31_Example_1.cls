/* With sharing : 
 *  1. if we define any apex class as 'with sharing' all the soql will be performed with respect to the 
 *     user who logged in 
 *  2. Users owd ,sharing rules, profile level permissions are taken into consideration 
 * 
 * Without sharing : 
 *  1. Run the soql's with the system context 
 *  2. User's OWD and sharing rules, profile are not taken to consideration when performing dml operation 
 */

public  class SOQL_31_Example_1 {
    public List<Account> accounts {set;get;}
    public SOQL_31_Example_1(){
        // 1. Write a query and fetch the data 
        // 2. We can write  soql query with in the constructor 
        accounts =[select Id,Name,Phone,Industry,Rating from Account ];
    }
    
}