testing
testCannotMoveDownLastObjectInLoadOrder
	"given"
	workingCopy
		add: Object new at: '1';
		add: Object new at: '2'.
	self assert: self initialLoadOrder equals: workingCopy loadOrder asArray.
	browser selectedObjectIndex: 2.
	"when"
	browser moveDownInLoadOrder.
	"then"
	self assert: {LBGitFilesArtifact path. '2'. '1'.} equals: workingCopy loadOrder asArray;
		assert: {LBGitFilesArtifact path. '2'. '1'.} equals: browser objectLabels asArray.