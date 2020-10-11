adding and removing
addUnloaded: anArtifact
	self assert: (store includesObjectAt: anArtifact path) not.
	(self unloadedArtifacts includesKey: anArtifact path)
		ifTrue: [self error: 'Artifact already in working copy' "Do not return to allow proceed in debugger."].
	self unloadedArtifacts at: anArtifact path put: anArtifact.
	self appendToLoadOrder: anArtifact path.