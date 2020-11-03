tests
testRejectArtifactAddition
	| path acceptReturned |
	path := 'conflicted-artifact'.
	tool := self newToolOn: (self patchAddingArtifactAt: path).
	self assert: #('conflicted-artifact (added)' 'Changed load order') equals: (tool rootNodes collect: [:each | tool nodeLabelOf: each]) asArray.
	tool selectNode: tool rootNodes first.
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (self resultIncludesDiffAt: path).