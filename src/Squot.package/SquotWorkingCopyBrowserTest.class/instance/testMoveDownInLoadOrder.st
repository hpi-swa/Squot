testing
testMoveDownInLoadOrder
	"given"
	workingCopy
		add: Object new at: '1';
		add: Object new at: '2'.
	self assert: #('1' '2') equals: workingCopy loadOrder asArray.
	browser selectedObjectIndex: 1.
	"when"
	browser moveDownInLoadOrder.
	"then"
	self assert: #('2' '1') equals: workingCopy loadOrder asArray;
		assert: #('2' '1') equals: browser objectLabels asArray.