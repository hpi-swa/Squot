initialize-release
addAssociation: aShadowOfAnAssociation with: aPatcher
	self flag: 'TODO: what if an association with an equal key already exists?'.
	itemSlots := itemSlots copyWith: (SquotDictionarySlot key: (aPatcher nameOf: aShadowOfAnAssociation undecorated) value: aShadowOfAnAssociation).