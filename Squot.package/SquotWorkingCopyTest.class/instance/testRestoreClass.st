tests
testRestoreClass
	| sampleClass sampleClassName firstMethod addedMethod firstVersion latestVersion |
	changeLogSuppressor suppressChangeNotificationsDuring: [
		sampleClass := classFactory newClass.
		sampleClass compile: 'firstMethod ^ self' classified: 'methods of first version'].
	sampleClassName := sampleClass name. "when unloaded, the class is renamed"
	firstMethod := sampleClass >> #firstMethod.
	workingCopy add: sampleClass at: 'src'.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	firstVersion := workingCopy baseVersion.
	changeLogSuppressor suppressChangeNotificationsDuring: [
		sampleClass compile: 'addedMethod ^ self' classified: 'methods of second version'.
		addedMethod := sampleClass >> #addedMethod].
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	
	changeLogSuppressor suppressChangeNotificationsDuring: [
		workingCopy loadVersion: firstVersion interactive: false].
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self deny: addedMethod isInstalled description: 'remove addedMethod'.
	
	changeLogSuppressor suppressChangeNotificationsDuring: [
		workingCopy loadVersion: latestVersion interactive: false].
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self assert: addedMethod equals: sampleClass >> addedMethod selector description: 'restore addedMethod'.