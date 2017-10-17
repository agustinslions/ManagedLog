# ManagedLog

## Description

This projects was created in order to improve the best way to see logs and events around the app when the app was in state of QA.

We can logs events and see what information is send to service in real time without console or program.

You can separate all logs by name of categories or see all at the same time.

## Installation

### Manually

This projects is easy to use. Only you need to add in your project the folder “ConsoleLog” with all files.

Files:
  - SLConsoleLogController.
  - SLConsoleLogManager.
  - SLFileSystemLogsTools
  - SLConsoleTypeViewController
  - SLLogsViewController

### CocoaPods

```
pod 'SLConsoleLog'

```

## Creation Logs

For create a log you can use this macro, SLLogWithType(log, type). 
In the first variable you put your log and the seconds is the name of the category of the logs.

For see your logs you have to present a viewController with the identifier “SLConsoleTypesViewController” in your app. This viewController show all names categories of logs and select which you like to see.

Other functionality of the projects is send this logs by mail, in order to inform to the developer or the responsable of the code.

## TODO

* Save all logs in coredata.
* Create new categorizations in the list.
* Sorting of logs.
* Add button to see logs in the bottom.
* Create version 1.1.0
