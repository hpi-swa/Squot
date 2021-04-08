capturing
capture: anObject with: aSquotObjectCapturer
	"Use aCapturer to answer a conserved form of me that is suitable to be stored in Snapshots."
	| replacementOrOriginal |
	class isImmediateClass ifTrue: [^ aSquotObjectCapturer capturePrimitiveValue: anObject in: self].
	class isBits ifTrue: [^ aSquotObjectCapturer captureBits: anObject in: self].
	replacementOrOriginal := self replacementFor: anObject using: aSquotObjectCapturer.
	^ aSquotObjectCapturer
		capture: replacementOrOriginal
		in: (replacementOrOriginal == anObject
			ifTrue: [self]
			ifFalse: [replacementOrOriginal class squotMirror])