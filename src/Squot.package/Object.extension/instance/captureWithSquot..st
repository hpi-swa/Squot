*Squot-trackable
captureWithSquot: aContentCapturer
	"Use aContentCapturer to answer a conserved form of me that is suitable to be stored in Snapshots."
	self class isImmediateClass ifTrue: [^ aContentCapturer capturePrimitiveValue: self].
	self class isBits ifTrue: [^ aContentCapturer captureBits: self].
	^ aContentCapturer
		capture: (self objectForDataStream: aContentCapturer)
		as: self squotShadowFactory