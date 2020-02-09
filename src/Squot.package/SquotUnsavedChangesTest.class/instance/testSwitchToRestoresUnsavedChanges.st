tests
testSwitchToRestoresUnsavedChanges
	| defaultHistorian |
	"given"
	"add another version"
	self addAnotherObject.
	workingCopy saveVersionWithMessage: 'add something else'.
	self changeTrackedObject.
	defaultHistorian := workingCopy loadedHistorian.
	workingCopy switchTo: otherHistorian.
	self assertTrackedObjectWasReset.
	"when"
	workingCopy switchTo: defaultHistorian.
	"then"
	self assertTrackedObjectStillChanged.