trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
    //first way
    for(Opportunity opp : [SELECT Id, StageName FROM Opportunity WHERE StageName='Closed Won' AND Id IN : Trigger.New]){
        taskList.add(new Task(Subject='Follow Up Test Task', WhatId = opp.Id));
    }
    
    //second way and we should use this
    /*
      for(opportunity opp: Trigger.New){
    
        if(opp.StageName!=trigger.oldMap.get(opp.id).stageName)
        {
            
            taskList.add(new Task(Subject = 'Follow Up Test Task',
                                  WhatId = opp.Id));
        }
    
    }
	*/
    
    if(taskList.size()>0){
        insert tasklist;
    }

}