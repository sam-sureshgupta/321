trigger Acc_Update on Account (before insert) {
    // Trigger logic should run for every one except satish
    //Get the current user first name
   String firstName = Userinfo.getFirstName();
    if(firstName!='Suresh'){
        List<Account> accounts =Trigger.new;
        for(Account a: accounts){
            a.rating='Cold';
            a.Ownership='Private';
        }
    }
}