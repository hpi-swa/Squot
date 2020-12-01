tests
testAcceptArtifactRemoval
	| path acceptReturned |
	path := 'removed-artifact'.
	tool := self newToolOn: (self patchRemovingArtifactAt: path).
	self assert: #('removed-artifact (removed)' 'Changed load order') equals: (tool rootNodes collect: [:each | (tool nodeLabelOf: each) asString]) asArray.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultDiffAt: path) isRemoval.