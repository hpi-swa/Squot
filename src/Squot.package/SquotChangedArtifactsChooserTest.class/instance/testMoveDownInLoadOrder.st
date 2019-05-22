testing
testMoveDownInLoadOrder
	| patch selectedPatch |
	patch := SquotPatch builder
		addDiff: (SquotArtifactDiffMock path: '1');
		addDiff: (SquotArtifactDiffMock path: '2');
		newLoadOrder: #('1' '2');
		buildPatch.
	tool := self newToolOn: patch.
	"when"
	tool
		selectNode: tool rootNodes first;
		moveDownSelectedInLoadOrder.
	tool accept.
	selectedPatch := tool selectedPatch.
	"then"
	self assert: selectedPatch diffs size = 2;
		assert: #('2' '1') equals: selectedPatch patchedLoadOrder.