tests
testSwitchAndMoveOverToBranchAtSameVersion
	| trackedObject originalHistorian otherHistorian contentsBeforeSwitch |
	"given"
	repository withUnitOfWork:
	[trackedObject := ValueHolder new contents: 'This is a test'.
	workingCopy add: trackedObject at: 'tracked'.
	workingCopy saveVersionWithMessage: 'initial version'.
	trackedObject contents: 'Unsaved changes'.
	originalHistorian := workingCopy loadedHistorian.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: workingCopy baseVersion.
	"when"
	workingCopy switchAndMoveUnsavedChangesOverTo: otherHistorian.
	"then"
	self assert: 'Unsaved changes' = trackedObject contents
		description: 'Unsaved changes not preserved'.
	"when"
	trackedObject contents: 'Other changes'.
	contentsBeforeSwitch := trackedObject contents.
	workingCopy switchAndMoveUnsavedChangesOverTo: originalHistorian.
	"then"
	self assert: 'Other changes' = trackedObject contents
		description: 'Unsaved changes not preserved'.
	self assert: contentsBeforeSwitch == trackedObject contents
		description: 'no patching should have occurred'].