accessing
itemSlotForValue: aDecoratedShadow
	^ itemSlots detect: [:each | each value name = aDecoratedShadow name]