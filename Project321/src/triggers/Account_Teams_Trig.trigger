trigger Account_Teams_Trig on Account (after insert) {
    // 1.Fetch all the new Records which are inserted 
    List<Account> accounts =Trigger.new;  //read-only
    //2. Fetch the userid of wilson
    User u =[select id from User where alias='jdoe'];
    List<AccountTeamMember> teams =new List<AccountTeamMember>();
    //3. Take one by one new Account and check the annualRevenue 
    for(Account a: accounts){
        if(a.annualRevenue > 50000){
            // 4. Create wilson as new  AccountTeammember 
            AccountTeamMember atm =new AccountTeamMember();
            atm.AccountId=a.Id; // Id of the account on which we want to create TeamMember
            atm.UserId=U.id;    // Id of the user whom you want to create as TeamMember
            atm.AccountAccessLevel='Read'; // specify the access level
            atm.TeamMemberRole='Account Manager';   // role of the teamMember
            teams.add(atm);
        }
    }
    insert teams;
}