tests
testRestoreClass
	| sampleClass sampleClassName firstMethod addedMethod firstVersion latestVersion |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	sampleClassName := sampleClass name. "when unloaded, the class is renamed"
	firstMethod := sampleClass >> #firstMethod.
	[workingCopy add: sampleClass at: 'src']
		on: SquotClassWithoutPackageException
		do: [:e | e resume: (PackageInfo named: classFactory packageName)].
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	firstVersion := workingCopy baseVersion.
	sampleClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	addedMethod := sampleClass >> #addedMethod.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	
	self suppressChangeNotificationsDuring:
		[SquotChangeSetTestCleanup removeNewChangeSetsNamedLike: sampleClassName
			after: [workingCopy loadVersion: firstVersion interactive: false]].
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self deny: addedMethod isInstalled description: 'remove addedMethod'.
	
	self suppressChangeNotificationsDuring:
		[SquotChangeSetTestCleanup removeNewChangeSetsNamedLike: sampleClassName
			after: [workingCopy loadVersion: latestVersion interactive: false]].
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self assert: addedMethod getSource asString
		equals: (sampleClass >> addedMethod selector) getSource asString
		description: 'restore addedMethod'.