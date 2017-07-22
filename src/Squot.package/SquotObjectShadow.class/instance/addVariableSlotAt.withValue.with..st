initialize-release
addVariableSlotAt: anInteger withValue: anObject with: aCapturer
	| slot |
	slot := SquotVariablePartSlot key: anInteger value: nil.
	slots add: (aCapturer capture: anObject asValueOfSlot: slot).