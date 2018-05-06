as yet unclassified
resolveArtifactConflict: unaryBlock
	| conflictNode acceptReturned |
	conflictNode := SquotDiffNodeSearchForChoiceNeeded new
		searchFrom: selectionTool rootNodes anyOne;
		nodeThatNeedsChoice.
	self assert: conflictNode offersChoice.
	selectionTool selectNode: conflictNode.
	unaryBlock value: conflictNode.
	self closeDialogPossiblyOpenedDuring: [selectionTool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.