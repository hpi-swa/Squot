testing
testMoveDownInLoadOrder
	"given"
	workingCopy
		add: Object new at: '1';
		add: Object new at: '2'.
	self assert: self initialLoadOrder equals: workingCopy loadOrder asArray.
	browser selectedObjectIndex: 1.
	"when"
	browser moveDownInLoadOrder.
	"then"
	self assert: self swappedLoadOrder equals: workingCopy loadOrder asArray;
		assert: self swappedLoadOrder equals: browser objectLabels asArray.