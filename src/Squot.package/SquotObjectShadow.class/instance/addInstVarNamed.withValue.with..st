initialize-release
addInstVarNamed: aString withValue: anObject with: aCapturer
	| slot |
	slot := SquotInstVarSlot key: aString value: nil.
	slots add: (aCapturer capture: anObject asValueOfSlot: slot).