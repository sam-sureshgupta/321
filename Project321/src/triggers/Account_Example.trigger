trigger Account_Example on Account (before insert) {
    List<Account> accounts = Trigger.new;
    User u = [select id from User where firstName='Jim'];
    for(Account a:accounts){
        if(a.industry=='banking'){
            a.ownerId= u.Id;
        }
    }
}