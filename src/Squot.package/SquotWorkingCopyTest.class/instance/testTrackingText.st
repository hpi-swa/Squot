tests
testTrackingText
	| text firstVersion latestVersion artifactId |
	text := Text fromString: 'Original text'.
	repository withUnitOfWork:
	[workingCopy add: text at: 'my text'.
	artifactId := (workingCopy artifactAt: 'my text') id.
	workingCopy saveVersionWithMessage: 'add text'.
	firstVersion := workingCopy baseVersion.
	self assert: artifactId equals: (firstVersion artifactAt: 'my text') id.
	text replaceFrom: 1 to: text size with: 'New value'.
	workingCopy saveVersionWithMessage: 'add text'.
	text replaceFrom: 1 to: text size with: 'New, unsaved value'.
	latestVersion := workingCopy baseVersion.
	self assert: artifactId equals: (latestVersion artifactAt: 'my text') id.
	
	self assert: (latestVersion parents includes: firstVersion) description: 'ancestry'.
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: (workingCopy baseVersion = firstVersion).
	self assert: (workingCopy loadedHistorian version = firstVersion).
	self assert: 'Original text' equals: text asString.
	self assert: artifactId equals: (workingCopy artifactAt: 'my text') id.
	
	workingCopy loadVersion: latestVersion interactive: false.
	self assert: (workingCopy baseVersion = latestVersion).
	self assert: (workingCopy loadedHistorian version = latestVersion).
	self assert: 'New value' equals: text asString.
	self assert: artifactId equals: (workingCopy artifactAt: 'my text') id].