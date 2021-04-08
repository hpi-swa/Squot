initialize-release
addInstVarNamed: aString withValue: anObject with: aCapturer
	| slot |
	self flag: #deprecated. "Use SquotObjectMirror>>initializeSnapshot:of: with: instead."
	slot := SquotInstVarSlot key: aString value: nil.
	slots add: (aCapturer capture: anObject asValueOfSlot: slot).