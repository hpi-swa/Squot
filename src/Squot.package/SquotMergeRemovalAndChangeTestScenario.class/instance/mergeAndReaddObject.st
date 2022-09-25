tests
mergeAndReaddObject
	| merge operation conflict |
	"when"
	merge := (operation := self workingCopy newMergeOperation)
		mergeVersion: incomingVersion;
		prepare.
	"then"
	conflict := merge conflictAt: conflictObjectId.
	self assert: conflict isResolved not.

	"when"
	conflict chooseIncoming. "the changed text"
	operation applyToWorkingCopy.