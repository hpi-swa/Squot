initialize-release
addVariableSlotAt: anInteger withValue: anObject with: aCapturer
	| slot |
	self flag: #deprecated. "Use SquotObjectMirror>>initializeSnapshot:of:with: instead."
	slot := SquotVariablePartSlot key: anInteger value: nil.
	slots add: (aCapturer capture: anObject asValueOfSlot: slot).