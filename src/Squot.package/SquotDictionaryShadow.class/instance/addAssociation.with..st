initialize-release
addAssociation: aShadowOfAnAssociation with: aPatcher
	"Adds an association to the dictionary.
	The association must already have been added to the patcher's target graph!"
	self flag: 'TODO: what if an association with an equal key already exists?'.
	itemSlots := itemSlots copyWith: (SquotDictionarySlot key: (aPatcher nameOf: aShadowOfAnAssociation undecorated) value: aShadowOfAnAssociation).