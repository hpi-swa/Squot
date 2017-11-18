tests
testSwitchAndMoveOverToBranchAtSameVersion
	| trackedObject originalHistorian otherHistorian |
	"given"
	trackedObject := ValueHolder new contents: 'This is a test'.
	workingCopy add: trackedObject at: 'tracked'.
	workingCopy saveNewVersionMessage: 'initial version' interactive: false.
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
	workingCopy switchAndMoveUnsavedChangesOverTo: originalHistorian.
	"then"
	self assert: 'Other changes' = trackedObject contents
		description: 'Unsaved changes not preserved'.