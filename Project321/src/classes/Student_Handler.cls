public class Student_Handler {
    public static void callMe(List<Student__c> students){
        // 1. Create List of Student Ids 
        List<Id> inActiveList =new List<Id>();
        //2. Take one by one student and check the active or inactive
        for(Student__c s:students){
            if(s.Active__c ==false){
                //3. Add the student Id to the inActiveList
                inActiveList.add(s.Id);
            }
        }
        //4. Fetch all the payments for these inactive students 
        List<Payment__c> payments =[select id from Payment__c where Student__c in :inActiveList];
        delete payments;
    }
    public static void invoke(List<Student__c> students){
        //1. Fetch the students who are undeleted from Student object 
        List<Student__c> myList =[select id,Active__c from Student__c where Id in :Students];
        for(Student__c s: myList){
            if(s.Active__c ==false){
                s.Active__c =true;
            }
        }
        update myList;
    }
}