global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    global Integer leadsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        
        return Database.getQueryLocator('select id, lastname ,status, company from Lead');
        
    }
    global void execute(Database.BatchableContext bc, List<Lead> allLeads){
        List<Lead> leads = new List<Lead>();
        for(Lead l: allLeads){
            l.LeadSource='Dreamforce';
        }
        update leads;
        
    }
    global void finish(Database.BatchableContext bc){
        System.debug(leadsProcessed + ' leads processed. Nigga!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        
       // EmailManager.sendMail('jgatsby1996@gmail.com','Total Leads Porcessed are ',' '+leadsProcessed);
        
    }

}