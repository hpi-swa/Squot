accessing
slotShadowType
	self flag: #stub. "this information is currently lost after diffing"
	self key isNil
		ifTrue: [^ SquotHashedCollectionSlot]
		ifFalse: [^ SquotDictionarySlot]