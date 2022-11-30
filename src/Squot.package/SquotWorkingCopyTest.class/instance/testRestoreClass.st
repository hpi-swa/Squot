tests
testRestoreClass
	| sampleClass sampleClassName firstMethod addedMethod firstVersion latestVersion artifactId path |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	sampleClassName := sampleClass name. "when unloaded, the class is renamed"
	firstMethod := sampleClass >> #firstMethod.
	repository withUnitOfWork:
	[workingCopy add: sampleClass at: sampleClass package name, '/', sampleClass name.
	path := workingCopy artifacts anyOne path.
	artifactId := (workingCopy artifactAt: path) id.
	workingCopy saveVersionWithMessage: 'first version'.
	firstVersion := workingCopy baseVersion.
	sampleClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	addedMethod := sampleClass >> #addedMethod.
	workingCopy saveVersionWithMessage: 'second version'.
	latestVersion := workingCopy baseVersion.
	
	self suppressChangeNotificationsDuring:
		[SquotChangeSetTestCleanup removeNewChangeSetsNamedLike: sampleClassName
			after: [workingCopy loadVersion: firstVersion interactive: false]].
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self deny: addedMethod isInstalled description: 'remove addedMethod'.
	self assert: artifactId equals: (workingCopy artifactAt: path) id.
	
	self suppressChangeNotificationsDuring:
		[SquotChangeSetTestCleanup removeNewChangeSetsNamedLike: sampleClassName
			after: [workingCopy loadVersion: latestVersion interactive: false]].
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self assert: addedMethod getSource asString
		equals: (sampleClass >> addedMethod selector) getSource asString
		description: 'restore addedMethod'].
	self assert: artifactId equals: (workingCopy artifactAt: path) id.