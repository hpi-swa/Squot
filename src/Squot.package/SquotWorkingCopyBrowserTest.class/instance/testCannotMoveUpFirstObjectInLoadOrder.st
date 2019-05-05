testing
testCannotMoveUpFirstObjectInLoadOrder
	"given"
	workingCopy
		add: Object new at: '1';
		add: Object new at: '2'.
	self assert: self initialLoadOrder equals: workingCopy loadOrder asArray.
	browser selectedObjectIndex: 1.
	"when"
	browser moveUpInLoadOrder.
	"then"
	self	assert: self initialLoadOrder equals: workingCopy loadOrder asArray;
		assert: self initialLoadOrder equals: browser objectLabels asArray.