testing
testMoveUpInLoadOrder
	"given"
	workingCopy
		add: Object new at: '1';
		add: Object new at: '2'.
	self assert: self initialLoadOrder equals: workingCopy loadOrder asArray.
	browser selectedObjectIndex: 2.
	"when"
	browser moveUpInLoadOrder.
	"then"
	self	assert: self swappedLoadOrder equals: workingCopy loadOrder asArray;
		assert: self swappedLoadOrder equals: browser objectLabels asArray.