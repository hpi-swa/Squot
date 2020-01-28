tests
testSwitchToRestoresUnsavedChangesOnly
	"When a branch was reset, do not restore versions that lead up to the temporary version."
	| trackedObject addedObject defaultHistorian otherHistorian |
	"given"
	trackedObject := StringHolder new contents: 'Tracked'; yourself.
	workingCopy add: trackedObject at: 'tracked.txt'.
	workingCopy saveVersionWithMessage: 'add something'.
	"remember this version on another branch"
	(otherHistorian := repository historianNamed: 'other') version: workingCopy baseVersion.
	"add another version that is discarded later"
	addedObject := StringHolder new contents: 'Added'; yourself.
	workingCopy add: addedObject at: 'added.txt'.
	workingCopy saveVersionWithMessage: 'add something else' .
	trackedObject contents: 'Unsaved'.
	defaultHistorian := workingCopy loadedHistorian.
	workingCopy switchTo: otherHistorian.
	self assert: trackedObject contents = 'Tracked'.
	"reset to earlier version"
	defaultHistorian version: otherHistorian version.
	"when"
	workingCopy switchTo: defaultHistorian.
	"then"
	self assert: trackedObject contents = 'Unsaved'.
	self deny: (workingCopy includesObject: addedObject).
	self deny: (workingCopy includesObjectAt: 'added.txt').