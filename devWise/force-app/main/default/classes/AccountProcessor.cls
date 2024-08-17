public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> accounIds){
        List<Account> accList = [select Id,Number_of_Contacts__c,(select id from contacts) from account where id in :accounIds];
        for(Account acc : accList){
            List<Contact> conList = acc.contacts;
            acc.Number_of_Contacts__c = conList.size();
        }
        update accList;
    }
}