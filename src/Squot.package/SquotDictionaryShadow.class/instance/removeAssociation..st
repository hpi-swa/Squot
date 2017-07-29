initialize-release
removeAssociation: aShadowOfAnAssociation
	itemSlots := itemSlots copyWithout:
		(itemSlots detect: [:each | each value = aShadowOfAnAssociation]).