utilities
resolveArtifactConflict: unaryBlock
	| conflictNode acceptReturned |
	conflictNode := SquotDiffNodeSearchForChoiceNeeded new
		searchFrom: tool rootNodes anyOne;
		nodeThatNeedsChoice.
	self assert: conflictNode offersChoice.
	tool selectNode: conflictNode.
	unaryBlock value: conflictNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.