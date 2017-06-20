initialize-release
addVariableSlotAt: anInteger withContent: aSquotPrimitiveValue
	| slot |
	slot := SquotVariablePartSlot key: anInteger value: aSquotPrimitiveValue.
	slots add: slot.