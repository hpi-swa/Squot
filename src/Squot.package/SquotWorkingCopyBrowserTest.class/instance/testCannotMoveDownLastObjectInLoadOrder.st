testing
testCannotMoveDownLastObjectInLoadOrder
	"given"
	workingCopy
		add: Object new at: '1';
		add: Object new at: '2'.
	self assert: self initialLoadOrder equals: workingCopy loadOrder asArray.
	browser selectedObjectIndex: workingCopy loadOrder size.
	"when"
	browser moveDownInLoadOrder.
	"then"
	self assert: self initialLoadOrder equals: workingCopy loadOrder asArray;
		assert: self initialLoadOrder equals: browser objectLabels asArray.