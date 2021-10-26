converting
asSlotWithValue: anObject
	self assert: target = anObject.
	^ anObject originalClass = Association
		ifTrue: [SquotDictionarySlot key: self value: anObject]
		ifFalse: [SquotHashedCollectionSlot key: self value: anObject]