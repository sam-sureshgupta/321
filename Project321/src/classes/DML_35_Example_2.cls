public class DML_35_Example_2 {
    
    public Account acc                  {set;get;} 
    public Contact   con                {set;get;}
    public List<ProductList> products   {set;get;}
    
    public DML_35_Example_2(){
        //1. Initialize the account,contact and wrapper list 
        acc =new Account();
        con=new Contact();
       
        products =new List<ProductList>();
        for(Integer i=1;i<=3;i++){
            ProductList p1 =new ProductList();
            products.add(p1);
        }
    }
    
    public void create(){
        // This will create a save point 
        SavePoint sp =Database.setSavePoint();
        try{
             // 1. Insert the account
             insert acc;
             // 2. Create a contact for the above created account 
             //    Account and contact are connected by lookup field 
             //    Name of the lookup field :"Account"
             //    If Lookup between two object is created by salesforce then we need append Id after Lookupfield
             //    FieldName : Account  then AccountId
             con.accountId=acc.Id;
             insert con;
             /* 3. Create a Opportunity for above account 
                   Account and opportunity are connected by standard Lookup field : Account 
                   so reffer the field as AccountId 
             */     
             Opportunity op=new Opportunity();
             op.name=acc.Name+'-';
             op.StageName='Prospecting';
             op.closeDate=System.today()+15;
             op.AccountId=acc.Id;
             insert op;
             /*  4. Get all the product names entered in the VF page 
                 All the product names are stored in List <ProductList> products 
             */
            Set<String> prodNames =new Set<String>();
            for(ProductList p:products){
                    prodNames.add(p.name);
            }
             // 5. Write a soql query to get all the products' Ids' based on the names fetched in step 4 
             List<Product2> prods =[select Id,Name from Product2 where name in:prodNames];
             
             // 6.create map with product name as key productId as value 
             Map<String,Id> prodMap =new Map<String,Id>();
            
             //7. Take one by one products from from list of products fetched from step -5
             //    and put the data in the map
                for(Product2 p2 :prods){
                    prodMap.put(p2.name,p2.Id);
                }
            
             // 8. fetch all the values form the prodMap 
              List<Id> productIds =prodMap.values();
              //9. Based in the productIds fetched in the step -8 write a query to fetch priceBookEntries
              List<PriceBookEntry> entries =[select id,product2Id from PriceBookEntry where Product2id in:productIds];
            
             //10. Create a Map with productId as key and PriceBookEntryId as value
               Map<Id,Id> entryMap =new Map<Id,Id>();
            
             // 11. Take one by one record from entries list fetched from step -9 and create a map
                for(PriceBookEntry pe :entries){
                    entryMap.put(pe.product2Id,pe.Id);
                }
            // 12. Create OpportunityLineItem for every record in the products 
            List<OpportunityLineItem> myList =new List<OpportunityLineItem>();
            for(ProductList p1 :products){ 
                // Pass the product Name key and get the productId
                Id prodId =prodMap.get(p1.name);
                // Pass the productId and get PriceBookEntryI
                Id entryid =entryMap.get(prodId);
                OpportunityLineItem newOli =new OpportunityLineItem();
                newOli.PriceBookEntryId=entryId;
                newOli.quantity=p1.quant;
                newOli.opportunityId=op.Id;
                newOli.UnitPrice=10000;                
                myList.add(newOli);
                
            }
            insert myList;
            Apexpages.Message msg1 =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Success Message');
            Apexpages.addMessage(msg1);
        }catch(Exception e){
            Database.rollback(sp);
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,e.getMessage());
            Apexpages.addMessage(msg);
        }
    }
}