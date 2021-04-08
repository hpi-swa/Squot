*Squot
squotMirror
	self isImmediateClass ifTrue: [^ SquotOpaqueValueMirror new].
	self isBits ifTrue: [^ SquotBitsMirror class: self].
	^ SquotObjectMirror class: self