trigger Oppty_Handler on Opportunity (after insert,after update) {
 if(Trigger.isAfter && Trigger.isInsert){
        Oppty_Trigger_Handler.afterInsert(Trigger.new);
    }else if(Trigger.isAfter && Trigger.isUpdate){
        Oppty_Trigger_Handler.afterUpdate(Trigger.oldMap,Trigger.newMap);
    }
}