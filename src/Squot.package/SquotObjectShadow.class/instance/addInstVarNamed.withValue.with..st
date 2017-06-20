initialize-release
addInstVarNamed: aString withValue: anObject with: aCapturer
	| slot |
	slot := SquotInstVarSlot key: aString value: nil.
	aCapturer capture: anObject asValueOfSlot: slot.
	slots add: slot.