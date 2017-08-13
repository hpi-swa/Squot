*Squot-trackable-capturing
captureWithSquot: aCapturer
	"Use aCapturer to answer a conserved form of me that is suitable to be stored in Snapshots."
	| replacementOrSelf |
	self class isImmediateClass ifTrue: [^ aCapturer capturePrimitiveValue: self].
	self class isBits ifTrue: [^ aCapturer captureBits: self].
	replacementOrSelf := self squotReplacementFor: aCapturer.
	^ aCapturer
		capture: replacementOrSelf
		as: replacementOrSelf squotShadowFactory