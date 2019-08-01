trigger Oppty_Share on Opportunity (after insert) {
    //1. Create Share List 
    List<OpportunityShare> share = new List<OpportunityShare>();
    //2. Get all the new Opportunities
    List<Opportunity> opptyList = Trigger.New;
    //3. Take one by one opprtunity
    for(Opportunity op:opptyList){
        if(op.Agent_Manager__c!=null){
          OpportunityShare os = new OpportunityShare();
          os.OpportunityId = op.Id;
          os.UserOrGroupId=op.Agent_Manager__c; // Id of the manager whith whome you want to share
          os.OpportunityAccessLevel='Read';     // Read Access 
          os.RowCause='Manual';   // Reason for sharing
          share.add(os);  
        }
    }
    insert share;
}