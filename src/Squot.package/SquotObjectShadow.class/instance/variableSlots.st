accessing
variableSlots
	^ slots associations select: [:each | each isMemberOf: SquotVariablePartSlot]