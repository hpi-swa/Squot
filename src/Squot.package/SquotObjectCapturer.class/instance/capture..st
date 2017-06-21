capturing dispatch
capture: anObject
	state
		ifNotNil: [^ anObject captureWithSquot: self]
		ifNil: [^ self beginCapturingFrom: anObject]