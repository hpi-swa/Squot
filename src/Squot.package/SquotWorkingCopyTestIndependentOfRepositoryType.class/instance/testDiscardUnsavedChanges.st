tests
testDiscardUnsavedChanges
	| trackedObject addedObject |
	"given"
	trackedObject := StringHolder new contents: 'Tracked'; yourself.
	workingCopy add: trackedObject at: 'tracked.txt'.
	workingCopy saveNewVersionMessage: 'add something' interactive: false.
	trackedObject contents: 'Unsaved'.
	addedObject := StringHolder new contents: 'Added'; yourself.
	workingCopy add: addedObject at: 'added.txt'.
	"when"
	workingCopy discardUnsavedChanges.
	"then"
	self assert: trackedObject contents = 'Tracked'.
	self deny: (workingCopy includesObject: addedObject).
	self deny: (workingCopy includesObjectAt: 'added.txt').