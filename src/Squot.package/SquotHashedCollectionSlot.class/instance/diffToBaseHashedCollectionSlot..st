comparing
diffToBaseHashedCollectionSlot: aHashedCollectionSlot
	self assert: aHashedCollectionSlot value = self value
		description: 'Items should be added or removed'.
	^ SquotDiffOfEqualObjects instance