

Network Users [Version 1.22]

Displays a list of users logged on to a specified Windows system.


The syntax of this command is:

NetUsers.exe [\\computername \\...] [/history] [/local] [/verbose]

 \\computername Allows you to query remote systems. Multiple computers
                can be specified, each separated by a space.
 /history|/h    Displays the user accounts that have logged on in the past. If
                history is omitted, currently logged on users are displayed.
 /local|/l      Includes local user accounts in the output, by default they
                are skipped. In a domain these are usually service accounts.
 /verbose|/v    Reports non-fatal problems as errors (such as deleted accounts)


 An argument of /? or -? displays this syntax and returns 1.
 A successful completion will return 0.


Copyright 2000-2006 Marty List, www.OptimumX.com


==================================================================


Revision History:
1.22 	01/18/2006
Fixed a bug in the output that caused problems when parsing.

1.21 	09/05/2002
Updated for Windows XP to skip 'LocalService' and 'NetworkService' accounts.

1.20 	11/11/2000
Added additional internal debugging options.

1.11 	02/12/2000
Fixed a cosmetic bug in the screen output.

1.10 	02/10/2000
Added last logon time to the history output (/h).

1.00 	01/28/2000
Initial release.
