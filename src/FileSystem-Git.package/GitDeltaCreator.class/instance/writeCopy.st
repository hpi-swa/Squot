as yet unclassified
writeCopy
	| left operationIndex operation offset |
	left := self matchSize - 16r10000 clampLow: 0.
	self matchSize: self matchSize - left.
	self skipSlotForOperation.
	operationIndex := self output size.
	operation := 16r80.
	offset := self matchIndex - 1.
	(offset bitAnd: 16r000000ff) > 0 ifTrue: [operation := operation bitOr: 16r01. self write: (offset"bitShift: 0")].
	(offset bitAnd: 16r0000ff00) > 0 ifTrue: [operation := operation bitOr: 16r02. self write: (offset bitShift: -8)].
	(offset bitAnd: 16r00ff0000) > 0 ifTrue: [operation := operation bitOr: 16r04. self write: (offset bitShift: -16)].
	(offset bitAnd: 16rff000000) > 0 ifTrue: [operation := operation bitOr: 16r08. self write: (offset bitShift: -24)].
	(self matchSize bitAnd: 16r00ff) > 0 ifTrue: [operation := operation bitOr: 16r10. self write: (self matchSize"bitShift: 0")].
	(self matchSize bitAnd: 16rff00) > 0 ifTrue: [operation := operation bitOr: 16r20. self write: (self matchSize bitShift: -8)].
	self output at: operationIndex put: operation.
	
	self targetIndex: self targetIndex + self matchSize.
	self matchIndex: self matchIndex + self matchSize.
	self matchSize: left.
	self matchIndex - 1 > 16rffffffff ifTrue: [self matchSize: 0].