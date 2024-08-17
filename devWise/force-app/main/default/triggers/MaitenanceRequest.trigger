trigger MaitenanceRequest on Case (before insert , after update) {
    if(Trigger.isUpdate && Trigger.isAfter){

      MaintenanceRequestHelper.updateWorkOrders(Trigger.New, Trigger.OldMap);

  }

}