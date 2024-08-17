@isTest
public class AddPrimaryContactTest {

    @testSetup
    public static void setup(){
         List<account> acc_lst = new List<account>();
        for (Integer i=0; i<50;i++) {
            account a = new account(name=string.valueOf(i),billingstate='NY');
            system.debug('account a = '+a);
            acc_lst.add(a);
        }
        for (Integer i=0; i<50;i++) {
            account a = new account(name=string.valueOf(50+i),billingstate='CA');
            system.debug('account a = '+a);
            acc_lst.add(a);
        }      
        insert acc_lst;
    }
    
    public static testMethod void TestQueueable(){
        List<Account> ac_ca=[select id from Account where billingstate='CA'];
        
        
        contact c = new contact(lastname='bhau');
        AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
        
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
       
       
        system.assertEquals(50, [select count() from contact where AccountId IN :ac_ca]);
    }
}