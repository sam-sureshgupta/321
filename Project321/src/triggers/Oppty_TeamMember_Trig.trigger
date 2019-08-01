/*
 - Whenever new opportunity is created with stageName as closed won make Jim as OpportunityTeamMember
*/

trigger Oppty_TeamMember_Trig on Opportunity (after insert) {
     List<Opportunity> opptyList = Trigger.New;
     List<OpportunityTeamMember> ot = new List<OpportunityTeamMember>();
     User us = [select id from user where firstName ='Jim'];
    for(Opportunity op:opptyList){
        if(op.StageName=='Closed Won'){
            OpportunityTeamMember otm = new OpportunityTeamMember();
            otm.OpportunityId=op.Id;
            otm.UserId=us.Id;
            otm.OpportunityAccessLevel='Read';
            otm.TeamMemberRole='Opportunity Manager';
            ot.add(otm);
        }
    }
    insert ot;
}