utilities
suppressChangeNotificationsDuring: aBlock
	self logChangeStartIfNotDoneAlready.
	^ SystemChangeNotifier uniqueInstance doSilently: aBlock