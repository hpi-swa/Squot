*Squot-trackable
captureWithSquot: aContentCapturer
	"Use aContentCapturer to answer a conserved form of me that is suitable to be stored in Snapshots."
	| replacementOrSelf |
	self class isImmediateClass ifTrue: [^ aContentCapturer capturePrimitiveValue: self].
	self class isBits ifTrue: [^ aContentCapturer captureBits: self].
	replacementOrSelf := self objectForDataStream: aContentCapturer.
	^ aContentCapturer
		capture: replacementOrSelf
		as: replacementOrSelf squotShadowFactory