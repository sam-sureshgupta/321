trigger Student_Trig on Student__c (before delete, after Undelete) { 
     if(Trigger.isBefore && Trigger.isDelete)
        Student_Handler.callMe(Trigger.old);
    else if(Trigger.isAfter && Trigger.isUndelete){
        Student_Handler.invoke(Trigger.new);
    }
}