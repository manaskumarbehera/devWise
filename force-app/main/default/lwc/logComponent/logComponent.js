/**
 * @description       : 
 * @author            : Manas Kumar Behera
 * @group             : 
 * @last modified on  : 07-05-2024
 * @last modified by  : Manas Kumar Behera
**/

import { LightningElement,track } from 'lwc';
import { log } from 'lightning/logger';


export default class LogComponent extends LightningElement {
    @track logs = [];
    @track newLog = '';

    handleLogChange(event) {
        this.newLog = event.target.value;
    }

    addLog() {
        if (this.newLog.trim() !== '') {
            const newLogEntry = {
                id: this.logs.length + 1,
                message: this.newLog,
                timestamp: new Date().toLocaleString()
            };

            // Add the new log entry to the array
            this.logs = [...this.logs, newLogEntry];

            // Clear the input field
            this.newLog = '';

            // Log the new entry using the lightning/logger module
            log({
                level: 'info',
                message: `New log entry added: ${newLogEntry.message}`,
                data: newLogEntry
            });
        }
    }

}