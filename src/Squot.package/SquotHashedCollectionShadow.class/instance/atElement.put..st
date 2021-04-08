initialize-release
atElement: aSquotCollectionElement put: anObject
	| existing |
	existing := itemSlots detect: [:each | each key = aSquotCollectionElement] ifNone: [].
	existing
		ifNil: [itemSlots := itemSlots copyWith: (SquotHashedCollectionSlot key: aSquotCollectionElement value: anObject)]
		ifNotNil: [existing value: anObject].