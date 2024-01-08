as yet unclassified
changeOperation
	^ (self class chooseCompatibleOperationClass ifNil: [^ nil]) new
		copyFrom: self;
		yourself