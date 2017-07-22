*Squot-trackable
captureWithSquot
	"Answer a conserved form of me that is suitable to be stored in Snapshots.
	Can be redefined to use another capturer or to return a shadow right away, when the shadow does not need to support cyclic references."
	self class isImmediateClass ifTrue: [^ SquotPrimitiveValue for: self].
	^ SquotObjectCapturer new captureStandalone: self