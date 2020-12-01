tests load order
testMoveDownInLoadOrder
	tool := self newToolOn: self patchWithTwoChangedArtifacts.
	"when"
	tool
		selectNode: tool rootNodes first;
		moveDownSelectedInLoadOrder.
	tool accept.
	"then"
	self assert: (self resultIncludesDiffAt: '1');
		assert: (self resultIncludesDiffAt: '2');
		assert: #('2' '1') equals: self resultLoadOrder.