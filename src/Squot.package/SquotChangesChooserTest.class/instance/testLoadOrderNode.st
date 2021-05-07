tests load order
testLoadOrderNode
	| loadOrderNode |
	tool := self newToolOn: self patchWithTwoChangedArtifacts.
	"when"
	tool
		selectNode: tool rootNodes second;
		moveUpSelectedInLoadOrder.
	"then"
	loadOrderNode := tool rootNodes detect: [:each | (tool nodeLabelOf: each) asString includesSubstring: 'load order'] ifNone: [].
	self assert: loadOrderNode notNil.
	tool selectNode: loadOrderNode; deactivateSelectedNode; accept.
	self deny: self loadOrderHasChanges.
	tool selectNode: loadOrderNode; activateSelectedNode; accept.
	self assert: self loadOrderHasChanges.