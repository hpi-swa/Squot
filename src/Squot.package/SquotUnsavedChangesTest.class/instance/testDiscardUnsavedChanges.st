tests
testDiscardUnsavedChanges
	"given"
	self changeTrackedObject;
		addAnotherObject.
	"when"
	workingCopy discardUnsavedChanges.
	"then"
	self assertTrackedObjectWasReset.
	self assertAddedObjectWasRemoved.