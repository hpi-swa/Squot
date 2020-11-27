tests
testTrackingObject
	| object firstVersion latestVersion |
	object := ValueHolder new contents: 'Original text'.
	repository withUnitOfWork:
	[workingCopy add: object at: 'my object'.
	workingCopy saveVersionWithMessage: 'Add object'.
	firstVersion := workingCopy baseVersion.
	self deny: (workingCopy patchRelativeToBase: firstVersion) hasChanges.
	object contents: 'New value'.
	workingCopy saveVersionWithMessage: 'Update object'.
	self denyChangesInWorkingCopy.
	object contents: 'New, unsaved value'.
	latestVersion := workingCopy baseVersion.
	
	self assert: (latestVersion parents includes: firstVersion) description: 'ancestry'.
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: (workingCopy baseVersion = firstVersion).
	self assert: (workingCopy loadedHistorian version = firstVersion).
	self assert: 'Original text' equals: object contents.
	self deny: (workingCopy patchRelativeToBase: firstVersion) hasChanges.
	
	workingCopy loadVersion: latestVersion interactive: false.
	self assert: (workingCopy baseVersion = latestVersion).
	self assert: (workingCopy loadedHistorian version = latestVersion).
	self assert: 'New value' equals: object contents.
	self deny: (workingCopy patchRelativeToBase: latestVersion) hasChanges].