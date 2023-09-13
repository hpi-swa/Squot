ui
textAt: aNumber
	self isInEditMode ifTrue: [^ (self toSources at: aNumber) asText].
	^ SquotTextUtilities
		diffFrom: (self sources: self fromSources at: aNumber)
		to: (self sources: self toSources at: aNumber)