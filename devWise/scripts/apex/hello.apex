/**
 * @description       : 
 * @author            : Manas Kumar Behera
 * @group             : 
 * @last modified on  : 08-17-2024
 * @last modified by  : Manas Kumar Behera
**/
// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);
System.debug(tempvar);

Integer x = 10;
Integer y = 10;
System.debug(x + y);

System.debug(
  Date.today(),
  DateTime.now(),
  Datetime.now(),
  Datetime.now().addHours(1),
  Datetime.now().addDays(7)
);

String s = 'hello';
System.debug(s.capitalize());
System.debug(s.charAt(0));