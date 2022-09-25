test fixture
createBaseVersion
	self workingCopy
		add: (others add: (ValueHolder new contents: 1)) at: 'first other';
		add: conflictObject at: 'text';
		add: (others add: (ValueHolder new contents: 2)) at: 'second other'.
	conflictObjectId := self workingCopy idOfObject: conflictObject.
	self assert: #('first other' 'text' 'second other') equals: workingCopy loadOrder asArray.
	self workingCopy saveVersionWithMessage: 'Initialize artifacts'.
	^ workingCopy loadedHistorian version