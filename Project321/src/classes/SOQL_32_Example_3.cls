public class SOQL_32_Example_3 {
    //1. Create PickList options
    public List<SelectOption> Fields {set;get;}
    //2. Create a List to store selected fields 
    public List<String> selected     {set;get;}
    //3. Create a string to store query 
    public String query              {set;get;}
    public List<Account> accounts    {set;get;}
    public SOQL_32_Example_3(){
        fields = new List<SelectOption>();
        selected = new List<String>();
        // 4. Create a list of fieldNames 
        List<String> fieldNames = new List<String>{'Name','Phone','Industry','Rating','Ownership','Active__c','Type'};
             //5. Take one by one field name and create picklist option
            for(String s:fieldNames){
                SelectOption op = new SelectOption(s,s);
                fields.add(op);
            }        
    }
    
    public void formQuery(){
        query = 'select id';
        //6. Take one by one field from selected fields
        for(String s:selected){
            query=query+','+s;
        }
         query=query+' from Account';
         accounts =Database.query(query); 
    }    
}