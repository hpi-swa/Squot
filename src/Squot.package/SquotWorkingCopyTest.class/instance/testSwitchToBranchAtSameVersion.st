tests
testSwitchToBranchAtSameVersion
	| trackedObject originalHistorian otherHistorian |
	"given"
	trackedObject := ValueHolder new contents: 'This is a test'.
	repository withUnitOfWork:
	[workingCopy add: trackedObject at: 'tracked'.
	workingCopy saveVersionWithMessage: 'initial version'.
	trackedObject contents: 'Unsaved changes'.
	originalHistorian := workingCopy loadedHistorian.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: workingCopy baseVersion.
	"when"
	workingCopy switchTo: otherHistorian.
	"then"
	self assert: 'This is a test' = trackedObject contents
		description: 'Unsaved changes not put away'.
	"when"
	trackedObject contents: 'Other changes'.
	workingCopy switchTo: originalHistorian.
	"then"
	self assert: 'Unsaved changes' = trackedObject contents
		description: 'Unsaved changes not preserved automatically'.
	"when"
	workingCopy switchTo: otherHistorian.
	"then"
	self assert: 'Other changes' = trackedObject contents
		description: 'Unsaved changes not preserved automatically'].