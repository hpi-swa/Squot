tests
testTrackingText
	| text firstVersion latestVersion |
	text := Text fromString: 'Original text'.
	repository withUnitOfWork:
	[workingCopy add: text at: 'my text'.
	workingCopy saveVersionWithMessage: 'add text'.
	firstVersion := workingCopy baseVersion.
	text replaceFrom: 1 to: text size with: 'New value'.
	workingCopy saveVersionWithMessage: 'add text'.
	text replaceFrom: 1 to: text size with: 'New, unsaved value'.
	latestVersion := workingCopy baseVersion.
	
	self assert: (latestVersion parents includes: firstVersion) description: 'ancestry'.
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: (workingCopy baseVersion = firstVersion).
	self assert: (workingCopy loadedHistorian version = firstVersion).
	self assert: 'Original text' equals: text asString.
	
	workingCopy loadVersion: latestVersion interactive: false.
	self assert: (workingCopy baseVersion = latestVersion).
	self assert: (workingCopy loadedHistorian version = latestVersion).
	self assert: 'New value' equals: text asString].