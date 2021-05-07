tests
testSwitchToRestoresUnsavedChangesOnly
	"When a branch was reset, do not restore versions that lead up to the temporary version."
	| defaultHistorian |
	"given"
	"add another version that is discarded later"
	self addAnotherObject.
	workingCopy saveVersionWithMessage: 'add something else' .
	self changeTrackedObject.
	defaultHistorian := workingCopy loadedHistorian.
	workingCopy switchTo: otherHistorian.
	self assertTrackedObjectWasReset.
	"reset to earlier version"
	defaultHistorian version: otherHistorian version.
	"when"
	workingCopy switchTo: defaultHistorian.
	"then"
	self assertTrackedObjectStillChanged.
	self assertAddedObjectWasRemoved.