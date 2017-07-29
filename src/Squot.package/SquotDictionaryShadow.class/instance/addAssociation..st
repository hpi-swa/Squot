initialize-release
addAssociation: aShadowOfAnAssociation
	self flag: 'TODO: what if an association with the same key already exists?'.
	itemSlots := itemSlots copyWith: (SquotDictionarySlot key: nil value: aShadowOfAnAssociation).