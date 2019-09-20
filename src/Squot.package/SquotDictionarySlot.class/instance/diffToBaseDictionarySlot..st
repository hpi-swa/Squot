comparing
diffToBaseDictionarySlot: aDictionarySlot
	self assert: aDictionarySlot value = self value
		description: 'Associations should be added or removed'.
	^ SquotDiffOfEqualObjects instance