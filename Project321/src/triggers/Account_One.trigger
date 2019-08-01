trigger Account_One on Account (before insert) {
    //1. Fetch all the new records
    List<Account> accounts =Trigger.new;
    for(Account a: accounts){
        a.industry='Energy';
        a.rating='Hot';
        a.ownership='Public';
    }
}