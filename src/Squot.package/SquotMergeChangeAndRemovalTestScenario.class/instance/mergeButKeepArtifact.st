tests
mergeButKeepArtifact
	| merge operation conflict |
	"when"
	merge := (operation := self workingCopy newMergeOperation)
		mergeVersion: incomingVersion;
		prepare.
	"then"
	conflict := merge conflictAt:
		(SquotToggles useNewApi
			ifTrue: [(baseVersion snapshot artifacts detect: [:each | each path = 'text']) id]
			ifFalse: ['text']).
	self assert: conflict isResolved not.

	"when"
	conflict chooseWorking. "the changed text"
	operation applyToWorkingCopy.