tests
mergeButKeepArtifact
	| merge operation conflict |
	"when"
	merge := (operation := self workingCopy newMergeOperation)
		mergeVersion: incomingVersion;
		prepare.
	"then"
	conflict := merge conflictAt: 'text'.
	self assert: conflict isResolved not.

	"when"
	conflict chooseWorking. "the changed text"
	operation applyToWorkingCopy.