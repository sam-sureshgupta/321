/* - When ever new Opportunity is created with stagename closed won then Share the record with Agent 
   - When ever stagename name is modified as closed won then share the record with Agent 
 */
public class Oppty_Trigger_Handler {
    public static void shareData(List<Opportunity> optyList){
        // 1. Create OptyShare list 
        List<OpportunityShare> share =new List<OpportunityShare>();
        //2. Take one by one opportunity and share with manager 
        for(Opportunity op :optyList){
            if(op.Agent_Manager__c!=null){
            OpportunityShare os =new OpportunityShare();
            os.OpportunityId=op.Id;
            os.OpportunityAccessLevel='Read';
            os.Rowcause='Manual';
            os.UserOrGroupId=op.Agent_Manager__c;
            share.add(os);
           }
        }
        insert share;
    }
    // insert trigger 
    public static void afterInsert(List<Opportunity> optyList){
        List<Opportunity> newList =new List<Opportunity>();
        for(Opportunity op:optyList){
            if(op.stageName=='Closed Won'){
                newList.add(op);
            }
        }
        shareData(newList);
    }
    public static void afterUpdate(Map<Id,Opportunity> oldMap, Map<Id,Opportunity> newMap){
        // Create a new List 
        List<Opportunity> newList =new List<Opportunity>();
        // Get the keys from the map
        Set<Id> optyIds =oldMap.keySet();
        // Take old value and new value and check stagename is modified to closed won
        for(Id key :optyIds){
            Opportunity old =oldMap.get(key);
            Opportunity newOpt =newMap.get(key);
            if(old.stageName!='Closed Won' && newOpt.stageName=='Closed Won'){
                newList.add(newOpt);
            }
        }
        shareData(newList);
        submit(newList);
    }
    // This method is submitting the records for approval. 
    public static void submit(List<Opportunity> optyList){
        
        for(Opportunity op :optyList){
            Approval.ProcessSubmitRequest request =new Approval.ProcessSubmitRequest();
            request.setObjectId(op.Id);  // Id of the record which we want to submit
            request.setSubmitterId(op.ownerId);  // Id of the user who is submitting the record
            request.setProcessDefinitionNameOrId('Manager');  // name of the approval process to which we are submitting 
            Approval.ProcessResult result=Approval.process(request);
        }
        
    } 
}