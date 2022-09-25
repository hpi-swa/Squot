tests
xtestCyclicReferences
	| array merge arrayMerge itemShadow |
	array := Array new: 1.
	array at: 1 put: array.
	self deny: (self merge: array into: array) hasChanges.
	merge := self mergeOf: array withChanges: [array at: 1 put: {array}].
	self assert: merge hasChanges.
	arrayMerge := merge mergeAt: (objectRegistry nameOf: array).
	itemShadow := (arrayMerge result variablePartSlotWithIndex: 1) value.
	self assert: (arrayMerge result nameOf: itemShadow) = (objectRegistry nameOf: (array at: 1)).
	self assert: (arrayMerge result nameOf: (itemShadow variablePartSlotWithIndex: 1) value) = (objectRegistry nameOf: array).
	self assert: ((itemShadow variablePartSlotWithIndex: 1) value variablePartSlotWithIndex: 1) value == itemShadow.