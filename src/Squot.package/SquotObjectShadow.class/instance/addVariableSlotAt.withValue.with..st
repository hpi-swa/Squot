initialize-release
addVariableSlotAt: anInteger withValue: anObject with: aCapturer
	| slot |
	slot := SquotVariablePartSlot key: anInteger value: nil.
	aCapturer capture: anObject asValueOfSlot: slot.
	slots add: slot.