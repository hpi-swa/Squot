reflection
references
	^ super references, (itemSlots collect: [:each | each key])